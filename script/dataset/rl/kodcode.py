"""KodCode-V1 (HF parquet) -> Jac RL `functions` task set, converted without an LLM and validated through the RL grader."""

import argparse, ast, json, random, re, sys, tempfile, textwrap
from collections import Counter, defaultdict
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import pyarrow.parquet as pq

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils            import jac_cli
from dataset.pipeline import write_rl_set
from rl.graders       import grade_many

# Setting =================================================
DS_NAME       = "kodcode-1k"
DS_ROOT       = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR        = f"{DS_ROOT}/raw/hf/KodCode-V1/data"
OUT_DIR       = f"{DS_ROOT}/rl/functions/{DS_NAME}"
POOL_DIR      = f"{DS_ROOT}/raw/hf/KodCode-V1/pool"     # --pool: every eligible task, gitignored (~270MB)
STYLES        = ("instruct", "complete")
PER_SUBSET    = 100                     # tasks kept per KodCode subset (small subsets keep what passes)
OVERSAMPLE    = 1.3                     # candidates per kept task; validation drops some
SPLIT_RATIO   = (0.8, 0.1, 0.1)         # train / dev / test
SHOW_EXAMPLES = 2                       # `>>>` examples kept in a `complete` docstring; others get 1 from the tests
MIN_TESTS     = 3
MAX_BENCH_SIM = 0.8                     # KodCode's similarity to HumanEval/MBPP/BigCodeBench/LCB
STD_IMPORTS   = {"typing", "collections", "math", "heapq", "itertools", "functools", "bisect", "re", "string"}
STARTER_WARN  = {"W2003"}               # unused parameter: the placeholder body ignores its args
WORKERS       = 16
BATCH         = 256                     # tasks graded between postgres purges
CHUNK         = 2048                    # tasks built + validated per progress checkpoint
GRADE_TIMEOUT = 30
GRADE_MEM_GB  = 3
SEED          = 3407
COLUMNS       = ["question_id", "subset", "style", "question", "solution", "test", "test_info",
                 "gpt_difficulty", "benchmark_similarity"]
SHARED_META   = {
    "task_type":     "functions",
    "target":        "main.jac",
    "output_format": "jac_block",
    "forbidden":     ["os", "sys", "subprocess", "shutil", "socket", "pathlib", "ctypes", "importlib", "::py::"],
}
TYPING_ALIAS  = {"List": "list", "Dict": "dict", "Set": "set", "Tuple": "tuple", "FrozenSet": "frozenset"}
PLACEHOLDER   = {"int": "0", "float": "0.0", "str": '""', "bool": "False", "list": "[]", "dict": "{}",
                 "set": "set()", "tuple": "()"}
JAC_KEYWORDS  = {"type", "edge", "node", "obj", "test", "default", "case", "visit", "spawn", "root", "entry", "exit"}
PY_MENTION    = re.compile(r"\b[Pp]ython (function|program|code|script)")
FENCE         = "```"
UNSAFE_ID     = re.compile(r"[^A-Za-z0-9_]+")   # Docs ids look like "Docs: Python310_123_C"; splits/*.txt are whitespace-split

# Functions ===============================================
def literal_type(v) -> str:
    """Jac type of one test literal; an empty container is `<base>[?]`, an unsupported literal `?`."""
    if isinstance(v, bool):
        return "bool"
    if v is None or isinstance(v, (int, float, str)):
        return type(v).__name__ if v is not None else "None"
    if not isinstance(v, (list, tuple, set, frozenset, dict)):
        return "?"                                          # complex, bytes, ...: leave the task untyped
    base = type(v).__name__
    if isinstance(v, dict):
        k, w = merge_types(literal_type(x) for x in v), merge_types(literal_type(x) for x in v.values())
        return f"dict[{k}, {w}]" if k and w else "dict[?]"
    if isinstance(v, tuple) and v:                          # tuples are usually fixed-shape records
        parts = [literal_type(x) for x in v]
        return f"tuple[{', '.join(parts)}]" if not any("?" in p for p in parts) else "tuple"
    parts = [literal_type(x) for x in v]
    if "?" in parts or (parts and not merge_types(parts)):
        return "?"                                          # unsupported or disagreeing elements
    return f"{base}[{merge_types(parts)}]" if parts else f"{base}[?]"


def merge_types(types) -> str | None:
    """One Jac type covering every observed type, or None when they disagree (or are all unknown)."""
    types = set(types)
    if "?" in types:
        return None
    known = {t for t in types if "?" not in t}
    bases = {t.split("[")[0] for t in known}
    for t in types - known:                                 # empty containers: bare base unless a typed one exists
        if t.split("[")[0] not in bases:
            known.add(t.split("[")[0])
    if known >= {"int", "float"}:
        known -= {"int"}
    optional = "None" in known and len(known) > 1
    if optional:
        known.discard("None")
    if len(known) != 1:
        return None
    return f"{known.pop()} | None" if optional else known.pop()


def annotation(node) -> str:
    """Python annotation -> Jac type (List[int] -> list[int], Optional[X] -> X | None)."""
    if isinstance(node, ast.Subscript):
        head = node.value.attr if isinstance(node.value, ast.Attribute) else getattr(node.value, "id", "")
        args = node.slice.elts if isinstance(node.slice, ast.Tuple) else [node.slice]
        if head == "Optional":
            return f"{annotation(args[0])} | None"
        if head == "Union":
            return " | ".join(annotation(a) for a in args)
        return f"{TYPING_ALIAS.get(head, head)}[{', '.join(annotation(a) for a in args)}]"
    if isinstance(node, ast.Attribute):
        return TYPING_ALIAS.get(node.attr, node.attr)
    if isinstance(node, ast.Name):
        return TYPING_ALIAS.get(node.id, node.id)
    if isinstance(node, ast.Constant) and node.value is None:
        return "None"
    return ast.unparse(node)


def typed(node, inferred: str | None) -> str | None:
    """Declared annotation, unless it is a bare container (`list`: W1036) the test literals refine."""
    if node is None:
        return inferred
    declared = annotation(node)
    if declared in PLACEHOLDER and inferred and inferred.startswith(f"{declared}["):
        return inferred
    return declared


def literal_asserts(test_src: str, fn: str) -> list[ast.Compare] | None:
    """All asserts as `fn(<literals>) == <literal>` nodes, or None if any test is anything else."""
    tree = ast.parse(test_src)
    if any(isinstance(n, (ast.With, ast.Raise)) or (isinstance(n, ast.FunctionDef) and n.args.args)
           for n in ast.walk(tree)):
        return None
    asserts = [n.test for n in ast.walk(tree) if isinstance(n, ast.Assert)]
    for t in asserts:
        if not (isinstance(t, ast.Compare) and len(t.ops) == 1 and isinstance(t.ops[0], ast.Eq)
                and isinstance(t.left, ast.Call) and getattr(t.left.func, "id", None) == fn
                and not t.left.keywords):
            return None
        try:
            [ast.literal_eval(a) for a in t.left.args]
            ast.literal_eval(t.comparators[0])
        except (ValueError, TypeError, SyntaxError, RecursionError):
            return None
    return asserts or None


def screen(row: dict) -> str | None:
    """Cheap filters over every row (CONVERSION.md §1); None = eligible, else the reason."""
    if row["style"] not in STYLES:
        return "style"
    if len(row["test_info"] or []) != 1:
        return "not_single_function"
    if (row["benchmark_similarity"] or 0) > MAX_BENCH_SIM:
        return "benchmark_similar"
    if FENCE in (row["question"] or ""):
        return "code_fence_in_question"
    try:
        sol = ast.parse(row["solution"])
        asserts = literal_asserts(row["test"], row["test_info"][0]["function_name"])
    except (SyntaxError, ValueError, RecursionError):
        return "unparsable"
    if any(isinstance(n, ast.ClassDef) for n in sol.body):
        return "class_in_solution"
    if asserts is None:
        return "non_literal_tests"
    if len(asserts) < MIN_TESTS:
        return "too_few_tests"
    mods = {a.name.split(".")[0] for n in ast.walk(sol) if isinstance(n, ast.Import) for a in n.names}
    mods |= {(n.module or "").split(".")[0] for n in ast.walk(sol) if isinstance(n, ast.ImportFrom)}
    if mods - STD_IMPORTS:
        return "non_std_import"
    return None


def signature_node(row: dict) -> ast.FunctionDef | None:
    """The `def` to convert: the stub for `complete`, test_info's declaration for `instruct`."""
    fn = row["test_info"][0]["function_name"]
    if row["style"] == "complete":
        return next((n for n in ast.walk(ast.parse(row["question"]))
                     if isinstance(n, ast.FunctionDef) and n.name == fn), None)
    return ast.parse(f"def {fn}{row['test_info'][0]['parameter_list']}: pass").body[0]


def trim_examples(doc: str, keep: int) -> tuple[str, int]:
    """Keep the first `keep` doctest examples (`>>>` line + its output lines); return (doc, examples kept)."""
    out, seen, in_example = [], 0, False
    for line in doc.splitlines():
        s = line.strip()
        if s.startswith(">>>"):
            seen += 1
            in_example = True
        elif not s:
            in_example = False
        if not in_example or seen <= keep:
            out.append(line)
    return re.sub(r"\n{3,}", "\n\n", "\n".join(out)).strip(), min(seen, keep)


def typed_solution(jac: str, fn: str, signature: str) -> str:
    """Give py2jac output our typed signature and import the `Any` it uses for the rest.

    py2jac writes `def f(x: Any) -> object` without importing Any, so `jac check` sees Unknown
    types and the grader's check gate fails solutions that run correctly.
    """
    jac = re.sub(rf"def {re.escape(fn)}\s*\([^{{]*?\)\s*->[^{{]*\{{", lambda _: f"def {signature} {{", jac, count=1)
    if re.search(r"\bAny\b", jac) and not re.search(r"import from typing \{[^}]*\bAny\b", jac):
        jac = "import from typing { Any }\n" + jac
    return jac


def build_task(row: dict) -> tuple[dict | None, str]:
    """One eligible row -> task dict for `write_rl_set` (solution via py2jac), or (None, reason)."""
    fn = row["test_info"][0]["function_name"]
    asserts = literal_asserts(row["test"], fn)
    try:
        sig = signature_node(row)
    except SyntaxError:
        return None, "unparsable_signature"
    a = sig.args if sig else None
    if not sig or a.vararg or a.kwarg or a.kwonlyargs or a.defaults or a.posonlyargs:
        return None, "complex_params"
    if any(len(t.left.args) != len(a.args) for t in asserts):
        return None, "arg_count_mismatch"

    calls = [([ast.literal_eval(x) for x in t.left.args], ast.literal_eval(t.comparators[0])) for t in asserts]
    params = []
    for i, arg in enumerate(a.args):
        typ = typed(arg.annotation, merge_types(literal_type(c[0][i]) for c in calls))
        if not typ:
            return None, "untyped_param"
        params.append(f"{'`' if arg.arg in JAC_KEYWORDS else ''}{arg.arg}: {typ}")
    ret = typed(sig.returns, merge_types(literal_type(c[1]) for c in calls))
    if not ret:
        return None, "untyped_return"
    signature = f"{fn}({', '.join(params)}) -> {ret}"

    example = f"Example:\n- `{ast.unparse(asserts[0].left)} == {ast.unparse(asserts[0].comparators[0])}`\n\n"
    if row["style"] == "complete":
        body, shown = trim_examples(textwrap.dedent(ast.get_docstring(sig) or ""), SHOW_EXAMPLES)
        example = "" if shown else example
    else:
        body = row["question"].strip()
    if not body:
        return None, "empty_description"
    body = PY_MENTION.sub(r"Jac \1", body)

    ok, solution = jac_cli.py2jac(row["solution"])
    if not ok:
        return None, "py2jac_fail"
    solution = typed_solution(solution, fn, signature)
    base = ret.split("[")[0]
    placeholder = "None" if "None" in ret.split(" | ") else PLACEHOLDER.get(base, "None")
    tests = f"import from main {{ {fn} }}\n" + "".join(
        f'\ntest "case {i}" {{\n    want = {ast.unparse(t.comparators[0])};\n    got = {ast.unparse(t.left)};\n'
        f'    assert got == want, f"expected={{want!r}} actual={{got!r}}";\n}}\n'
        for i, t in enumerate(asserts))
    return {
        "id":       UNSAFE_ID.sub("_", row["question_id"]),
        "meta":     {"entrypoints": [fn], "difficulty": row["gpt_difficulty"], "origin_id": row["question_id"],
                     "subset": row["subset"], "style": row["style"]},
        "visible":  {"request.md": f"# {fn}\n\n{body}\n\n{example}Implement `{signature}`.\n",
                     "starter.jac": f"def {signature} {{\n    return {placeholder};\n}}\n"},
        "hidden":   {"tests.jac": tests, "solution.jac": solution},
        "n_hidden": len(asserts),
    }, ""


def scan(in_dir: str | Path) -> tuple[dict[str, list[dict]], Counter]:
    """Screen every row; return eligible rows by subset and the count per screen verdict."""
    pool, verdicts = defaultdict(list), Counter()
    for f in sorted(Path(in_dir).glob("train-*.parquet")):
        for row in pq.read_table(f, columns=COLUMNS).to_pylist():
            reason = screen(row)
            verdicts[reason or "eligible"] += 1
            if reason is None:
                pool[row["subset"]].append(row)
    return pool, verdicts


def validate(tasks: list[dict]) -> dict[str, str]:
    """Grade every task's solution and starter through the RL grader; return {id: reject reason}.

    A task passes when its py2jac solution scores 1.0, its starter does not, and the starter
    type-checks with no warning outside STARTER_WARN. Postgres is purged between batches.
    """
    reasons: dict[str, str] = {}
    with tempfile.TemporaryDirectory(prefix="kodcode_stage_") as stage, ThreadPoolExecutor(WORKERS) as pool:
        write_rl_set(tasks, stage, SHARED_META, (1.0, 0.0, 0.0), SEED)
        starter_checks = dict(zip([t["id"] for t in tasks],
                                  pool.map(lambda t: jac_cli.check_warnings(t["visible"]["starter.jac"]), tasks)))
        for i in range(0, len(tasks), BATCH):
            batch = tasks[i:i + BATCH]
            items = [(f"```jac\n{t[k][f].rstrip()}\n```", f"{stage}/tasks/{t['id']}")
                     for t in batch for k, f in (("hidden", "solution.jac"), ("visible", "starter.jac"))]
            grades = grade_many(items, WORKERS, GRADE_TIMEOUT, GRADE_MEM_GB)
            for t, sol, start in zip(batch, grades[0::2], grades[1::2]):
                ok, warns = starter_checks[t["id"]]
                if "infra_error" in (sol["status"], start["status"]):
                    reasons[t["id"]] = "infra_error"
                elif sol["status"] != "pass":
                    reasons[t["id"]] = f"solution_{sol['status']}"
                elif not ok:
                    reasons[t["id"]] = "starter_check_fail"
                elif set(warns) - STARTER_WARN:
                    reasons[t["id"]] = f"starter_warning_{sorted(set(warns) - STARTER_WARN)[0]}"
                elif start["reward"] == 1.0:
                    reasons[t["id"]] = "starter_passes_all"
            jac_cli.purge_pg()
            jac_cli.start_pg()
            print(f"  graded {min(i + BATCH, len(tasks))}/{len(tasks)}, rejected so far {len(reasons)}")
    return reasons


def process(candidates: list[dict], progress: Path) -> tuple[list[dict], list[dict]]:
    """Build + validate candidates CHUNK at a time; return (passing tasks, rejected rows) in candidate order.

    Each verdict is appended to `progress` (JSONL), so a crashed run resumes where it stopped.
    """
    done = {}
    if progress.exists():
        for line in progress.open():
            r = json.loads(line)
            done[r["origin_id"]] = r
        print(f"Resuming: {len(done)} candidates already processed")
    todo = [r for r in candidates if r["question_id"] not in done]
    with ThreadPoolExecutor(WORKERS) as ex, progress.open("a") as log:
        for i in range(0, len(todo), CHUNK):
            chunk = todo[i:i + CHUNK]
            built = list(ex.map(build_task, chunk))           # py2jac is a subprocess per task
            tasks = [t for t, _ in built if t is not None]
            jac_cli.purge_pg()
            jac_cli.start_pg()
            reasons = validate(tasks) if tasks else {}
            for row, (t, why) in zip(chunk, built):
                why = why or reasons.get(t["id"], "")
                rec = {"origin_id": row["question_id"], "subset": row["subset"], "reason": why,
                       "task": None if why else t}
                done[rec["origin_id"]] = rec
                log.write(json.dumps(rec) + "\n")
            log.flush()
            print(f"Processed {len(done)}/{len(candidates)} candidates, "
                  f"{sum(not r['reason'] for r in done.values())} pass")
    recs = [done[r["question_id"]] for r in candidates]
    return ([r["task"] for r in recs if not r["reason"]],
            [{k: r[k] for k in ("origin_id", "subset", "reason")} for r in recs if r["reason"]])


def convert(in_dir=IN_DIR, out_dir=OUT_DIR, per_subset: int | None = PER_SUBSET,
            split_ratio=SPLIT_RATIO, source: str = "KodCode/KodCode-V1 (train)") -> None:
    # 1. Screen every row, then draw candidates per subset (per_subset=None: every eligible row)
    pool, verdicts = scan(in_dir)
    print(f"Screened {sum(verdicts.values())} rows: {dict(verdicts.most_common())}")
    rng = random.Random(SEED)
    take = lambda n: n if per_subset is None else min(n, int(per_subset * OVERSAMPLE))
    candidates = [r for subset in sorted(pool) for r in rng.sample(pool[subset], take(len(pool[subset])))]

    # 2. Build tasks and validate them through the grader
    Path(out_dir).mkdir(parents=True, exist_ok=True)
    progress = Path(out_dir) / "progress.jsonl"
    tasks, rejected = process(candidates, progress)

    # 3. Keep the first per_subset passing tasks per subset
    kept, per_count = [], Counter()
    for t in tasks:
        if per_subset is None or per_count[t["meta"]["subset"]] < per_subset:
            kept.append(t)
            per_count[t["meta"]["subset"]] += 1

    # 4. Write the set
    counts = write_rl_set(kept, out_dir, SHARED_META, split_ratio, SEED, rejected, {
        "source":   source,
        "subset":   dict(sorted(per_count.items())),
        "style":    dict(Counter(t["meta"]["style"] for t in kept).most_common()),
        "screened": dict(verdicts.most_common()),
    })
    progress.unlink()
    print(f"Wrote {len(kept)} tasks {counts} to {Path(out_dir).resolve()} ({len(rejected)} rejected)")

# Run =====================================================
if __name__ == "__main__":
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument("--pool", action="store_true",
                     help=f"convert every eligible row into {POOL_DIR} (all ids in train; draw curated sets from it)")
    args = cli.parse_args()
    if args.pool:
        convert(out_dir=POOL_DIR, per_subset=None, split_ratio=(1.0, 0.0, 0.0))
    else:
        convert()
