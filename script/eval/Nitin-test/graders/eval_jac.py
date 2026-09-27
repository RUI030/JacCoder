#!/usr/bin/env python3
"""Grade generated Jac for function and OSP evaluation suites.

This script is deliberately model-provider neutral. A generation runner writes
samples to JSONL; this grader checks and tests them under an isolated temporary
directory, then emits per-sample results and aggregate pass@k metrics.

Problem JSONL schema
--------------------
Required:
  {"id": "problem-id", "track": "function" | "osp"}

Optional:
  "prompt": str                 Stored for generation; ignored by the grader.
  "prefix": str                 Prepended to a sample's `completion` field.
  "suffix": str                 Appended to a sample's `completion` field.
  "test_blocks": str | [str]    Hidden Jac `test` blocks.
  "required_features": [str]    Objective, task-specific structural contract.
  "forbidden_features": [str]   Objective, task-specific structural contract.
  "floor_jac": str              Optional reference-similarity diagnostic.
  "idiomatic_jac": str          Optional reference-similarity diagnostic.

Sample JSONL schema
-------------------
Required:
  {"problem_id": "problem-id", "sample_id": 0, ...}

Provide one of:
  "jac": str                    Complete Jac source.
  "candidate": str              Complete Jac source (pipeline compatibility).
  "output": str                 Complete raw model output.
  "completion": str             Body/text assembled as prefix+completion+suffix.

A complete source may be raw Jac or one fenced ```jac block. Hidden tests never
appear in the generated-source artifact or output results.

Supported feature contract names
--------------------------------
  node, edge, walker, ability_entry, spawn, visit, report, disengage,
  graph_connect, graph_reference, obj, typed_def, typed_has, no_dynamic_types,
  no_python_syntax, no_import_py, no_test_blocks

Examples
--------
  python scripts/eval_jac.py \
      --problems evals/py2jac/v1/problems.jsonl \
      --samples runs/model-a/samples.jsonl \
      --out-dir runs/model-a/graded \
      --k 1,5,10 --workers 2

Outputs:
  results.jsonl  One row per sample.
  summary.json   Overall and per-track rates, pass@k, status counts, metadata.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import re
import shutil
import signal
import subprocess
import tempfile
import time
from collections import Counter, defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime, timezone
from difflib import SequenceMatcher
from pathlib import Path
from typing import Any, Iterable


FENCED_JAC_RE = re.compile(r"```jac\s*\n?(.*?)```", re.IGNORECASE | re.DOTALL)
ANY_FENCE_RE = re.compile(r"```")
TOKEN_RE = re.compile(r"\w+|[^\w\s]", re.UNICODE)

# The 0.36 native test runner mishandles modules whose functions are demoted
# to Python-only ("no tests ran") and can segfault on demoted annexes. Server
# codespace keeps CPython semantics for graded tests; see
# scripts/eval/repair_function_eval_tests.py for the suite-repair counterpart.
JAC_TOML_SERVER = '[build]\ndefault_codespace = "server"\n'

FEATURE_PATTERNS: dict[str, re.Pattern[str]] = {
    "node": re.compile(r"(?m)^\s*node(?::\w+)?\s+\w+\s*\{"),
    "edge": re.compile(r"(?m)^\s*edge(?::\w+)?\s+\w+\s*\{"),
    "walker": re.compile(r"(?m)^\s*walker(?::\w+)?\s+\w+\s*\{"),
    "ability_entry": re.compile(r"\bcan\b[^\n{]*\bwith\b[^\n{]*\bentry\b"),
    "spawn": re.compile(r"\bspawn\b"),
    "visit": re.compile(r"\bvisit\b"),
    "report": re.compile(r"\breport\b"),
    "disengage": re.compile(r"\bdisengage\b"),
    "graph_connect": re.compile(r"(?:\+\+>|<\+\+|\+>[^\n]*:\+>)"),
    "graph_reference": re.compile(r"\[(?:<--|-->|<-->|\?-->|<--\?)"),
    "obj": re.compile(r"(?m)^\s*obj(?::\w+)?\s+\w+\s*\{"),
    "typed_def": re.compile(
        r"\bdef(?::\w+)?\s+\w+\s*\([^)]*:\s*[^,)]+(?:,[^)]*)?\)\s*->\s*[^\s{]+"
    ),
    "typed_has": re.compile(r"\bhas\s+\w+\s*:\s*[^;=,]+"),
    "no_dynamic_types": re.compile(r"$^"),  # computed, not directly matched
    "no_python_syntax": re.compile(r"$^"),
    "no_import_py": re.compile(r"$^"),
    "no_test_blocks": re.compile(r"$^"),
}

DYNAMIC_TYPE_RE = re.compile(
    r"(?::\s*|->\s*|\[\s*|\|\s*|,\s*)(?:Any|any|object)\b"
)
PYTHON_BLOCK_RE = re.compile(
    r"(?m)^\s*(?:def|class|if|elif|else|for|while|try|except|with)\b[^\n{]*:\s*(?:#.*)?$"
)
IMPORT_PY_RE = re.compile(
    r"\bimport:py\b|^\s*from\s+\S+\s+import\s+", re.MULTILINE
)
TEST_BLOCK_RE = re.compile(r'(?m)^\s*test\s+["\']')
RANGE_LEN_RE = re.compile(r"\brange\s*\(\s*len\s*\(")
INFRA_ERROR_RE = re.compile(
    r"embedded postgres|postgres not ready|could not connect to (?:the )?database|"
    r"connection to server.*failed|initdb|database system is starting up|"
    r"No space left on device|too many clients already",
    re.IGNORECASE | re.DOTALL,
)


@dataclass(frozen=True)
class ProcessResult:
    returncode: int | None
    stdout: str
    stderr: str
    elapsed_ms: float
    timed_out: bool = False
    launch_error: str | None = None


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open(encoding="utf-8") as handle:
        for line_no, line in enumerate(handle, 1):
            if not line.strip():
                continue
            try:
                row = json.loads(line)
            except json.JSONDecodeError as exc:
                raise ValueError(f"{path}:{line_no}: invalid JSON: {exc}") from exc
            if not isinstance(row, dict):
                raise ValueError(f"{path}:{line_no}: expected a JSON object")
            rows.append(row)
    return rows


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def extract_jac(text: str) -> tuple[str | None, str | None]:
    """Return (Jac source, extraction error)."""
    if not isinstance(text, str) or not text.strip():
        return None, "empty model output"
    matches = FENCED_JAC_RE.findall(text)
    if matches:
        if len(matches) != 1:
            return None, f"expected one fenced Jac block, found {len(matches)}"
        source = matches[0].strip()
        return (source, None) if source else (None, "empty fenced Jac block")
    if ANY_FENCE_RE.search(text):
        return None, "model output contains a fence but no complete ```jac block"
    return text.strip(), None


def assemble_source(problem: dict[str, Any], sample: dict[str, Any]) -> tuple[str | None, str | None]:
    if "completion" in sample:
        completion, error = extract_jac(str(sample.get("completion", "")))
        if error:
            return None, error
        return (
            str(problem.get("prefix", ""))
            + (completion or "")
            + str(problem.get("suffix", "")),
            None,
        )

    for key in ("jac", "candidate", "output"):
        if key in sample:
            return extract_jac(str(sample.get(key, "")))
    return None, "sample must contain jac, candidate, output, or completion"


def test_blocks(problem: dict[str, Any]) -> str:
    value = problem.get("test_blocks", "")
    if isinstance(value, list):
        return "\n\n".join(str(item).strip() for item in value if str(item).strip())
    return str(value).strip()


def feature_flags(source: str) -> dict[str, bool]:
    flags = {name: bool(pattern.search(source)) for name, pattern in FEATURE_PATTERNS.items()}
    flags["no_dynamic_types"] = not bool(DYNAMIC_TYPE_RE.search(source))
    flags["no_python_syntax"] = not bool(PYTHON_BLOCK_RE.search(source))
    flags["no_import_py"] = not bool(IMPORT_PY_RE.search(source))
    flags["no_test_blocks"] = not bool(TEST_BLOCK_RE.search(source))
    return flags


def static_diagnostics(source: str) -> dict[str, Any]:
    """Neutral static diagnostics; these are not combined into a style score."""
    flags = feature_flags(source)
    lines = source.splitlines()
    nonempty = [line for line in lines if line.strip()]
    lengths = [len(line) for line in nonempty]
    depth = 0
    max_depth = 0
    for character in source:
        if character == "{":
            depth += 1
            max_depth = max(max_depth, depth)
        elif character == "}":
            depth = max(0, depth - 1)
    return {
        "features": flags,
        "dynamic_type_mentions": len(DYNAMIC_TYPE_RE.findall(source)),
        "range_len_loops": len(RANGE_LEN_RE.findall(source)),
        "python_syntax_smell": not flags["no_python_syntax"],
        "import_py_smell": not flags["no_import_py"],
        "included_test_blocks": not flags["no_test_blocks"],
        "source_lines": len(lines),
        "nonempty_lines": len(nonempty),
        "max_line_length": max(lengths, default=0),
        "mean_line_length": round(sum(lengths) / len(lengths), 3) if lengths else 0.0,
        "long_lines_over_100": sum(length > 100 for length in lengths),
        "max_brace_depth": max_depth,
    }


def validate_contract(
    problem: dict[str, Any], flags: dict[str, bool]
) -> tuple[bool, list[str], list[str]]:
    required = [str(item) for item in problem.get("required_features", [])]
    forbidden = [str(item) for item in problem.get("forbidden_features", [])]
    unknown = sorted((set(required) | set(forbidden)) - set(FEATURE_PATTERNS))
    if unknown:
        raise ValueError(f"problem {problem['id']!r} has unknown feature names: {unknown}")
    missing = [name for name in required if not flags[name]]
    present_forbidden = [name for name in forbidden if flags[name]]
    return not missing and not present_forbidden, missing, present_forbidden


def normalized_similarity(source: str, reference: str) -> float:
    """Token similarity diagnostic; never treated as an idiomaticity score."""
    left = " ".join(TOKEN_RE.findall(source))
    right = " ".join(TOKEN_RE.findall(reference))
    if not left or not right:
        return 0.0
    return round(SequenceMatcher(None, left, right, autojunk=False).ratio(), 4)


def reference_diagnostics(problem: dict[str, Any], source: str) -> dict[str, Any] | None:
    floor = problem.get("floor_jac")
    idiomatic = problem.get("idiomatic_jac")
    if not isinstance(floor, str) and not isinstance(idiomatic, str):
        return None
    result: dict[str, Any] = {}
    if isinstance(floor, str):
        result["floor_similarity"] = normalized_similarity(source, floor)
    if isinstance(idiomatic, str):
        result["idiomatic_similarity"] = normalized_similarity(source, idiomatic)
    if "floor_similarity" in result and "idiomatic_similarity" in result:
        floor_score = result["floor_similarity"]
        idiom_score = result["idiomatic_similarity"]
        result["closer_reference"] = (
            "idiomatic" if idiom_score > floor_score
            else "floor" if floor_score > idiom_score
            else "tie"
        )
    result["note"] = "diagnostic token similarity; not an idiomaticity score"
    return result


# --- JacCoder patch: per-test results + actual values from `jac test -v` ---
# `jac 0.36.1` runs pytest (+xdist) under the hood; latest main is a custom
# runner and will need a different parser (see PROVENANCE.md).
_TEST_NAME_RE = re.compile(r'^\s*test\s+"([^"]+)"\s*\{', re.MULTILINE)
_TEST_BLOCK_OPEN_RE = re.compile(r'test\s+"([^"]+)"\s*\{')
# -v lines: "[gw0] [ 50%] PASSED f.jac::t1" (xdist) or "f.jac::t1 PASSED [ 50%]",
# plus "FAILED f.jac::t0 - ..." / "ERROR f.jac::t0" in the short summary.
_PYTEST_VERDICT_RES = (
    re.compile(r"^(?:\[gw\d+\]\s+\[\s*\d+%\]\s+)?(PASSED|FAILED|ERROR)\s+\S+::(\S+)", re.MULTILINE),
    re.compile(r"^\S+::(\S+)\s+(PASSED|FAILED|ERROR)\b", re.MULTILINE),
)
_PYTEST_SECTION_RE = re.compile(r"^_{3,} (?:ERROR at \w+ of )?(\S+) _{3,}$")
_ACTUAL_TAG = "@@ACTUAL"
_ACTUAL_RE = re.compile(rf"^{_ACTUAL_TAG} (\S+) (\d+) (.*)$", re.MULTILINE)
_ACTUAL_LIMIT = 1000
_STRING_PREFIX_RE = re.compile(r"[rRbBfFuU]{0,2}(\"\"\"|'''|\"|')")


def _skip_string(text: str, i: int) -> int | None:
    """If a string literal starts at text[i], return the index past its end."""
    m = _STRING_PREFIX_RE.match(text, i)
    if not m or (m.start(1) > i and text[i - 1:i].isalnum()):
        return None
    quote, j = m.group(1), m.end()
    while j < len(text):
        # A backslash never lets the next char close the literal, raw or not
        # (r"a\"b" is one string), so skip it either way.
        if text[j] == "\\":
            j += 2
        elif text.startswith(quote, j):
            return j + len(quote)
        else:
            j += 1
    return len(text)


def _split_top_level(text: str, seps: tuple[str, ...]) -> list[tuple[int, str]]:
    """(index, sep) of each separator outside strings/brackets."""
    hits, depth, i = [], 0, 0
    while i < len(text):
        end = _skip_string(text, i)
        if end is not None:
            i = end
            continue
        ch = text[i]
        if ch in "([{":
            depth += 1
        elif ch in ")]}":
            depth -= 1
        elif depth == 0:
            sep = next((s for s in seps if text.startswith(s, i)), None)
            if sep:
                hits.append((i, sep))
                i += len(sep)
                continue
        i += 1
    return hits


def _matching_close(text: str, open_idx: int) -> int | None:
    depth, i = 0, open_idx
    while i < len(text):
        end = _skip_string(text, i)
        if end is not None:
            i = end
            continue
        if text[i] in "([{":
            depth += 1
        elif text[i] in ")]}":
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return None


def _instrument_assert(stmt: str, name: str, k: int) -> str | None:
    """`assert (L == R)[, msg]` -> bind L, print its repr, assert on the binding."""
    body = stmt.strip()
    if not body.startswith("assert"):
        return None
    rest = body[len("assert"):].strip()
    if rest.startswith("("):
        close = _matching_close(rest, 0)
        if close is None:
            return None
        inner, trailing = rest[1:close], rest[close + 1:]
    else:
        commas = _split_top_level(rest, (",",))
        cut = commas[0][0] if commas else len(rest)
        inner, trailing = rest[:cut], rest[cut:]
    eqs = [(i, s) for i, s in _split_top_level(inner, ("==", "!=", "<=", ">=")) if s == "=="]
    if len(eqs) != 1 or len(_split_top_level(inner, ("==", "!=", "<=", ">="))) != 1:
        return None
    lhs, rhs = inner[:eqs[0][0]].strip(), inner[eqs[0][0] + 2:].strip()
    if not lhs or not rhs:
        return None
    var = f"_jaccoder_got{k}"
    indent = stmt[: len(stmt) - len(stmt.lstrip())]
    return (f"{indent}{var} = {lhs};"
            f"{indent}print(\"{_ACTUAL_TAG} {name} {k} \" + repr({var}));"
            f"{indent}assert ({var} == {rhs}){trailing}")


def instrument_tests(hidden_tests: str) -> str:
    """Rewrite each `assert (L == R)` in each test block so a failing test's
    captured stdout carries `@@ACTUAL <test> <k> <repr(L)>`. Statements that
    don't parse as a single top-level `==` are left untouched."""
    out, pos = [], 0
    for m in _TEST_BLOCK_OPEN_RE.finditer(hidden_tests):
        if m.start() < pos:
            continue
        close = _matching_close(hidden_tests, m.end() - 1)
        if close is None:
            break
        body = hidden_tests[m.end():close]
        cuts = [i for i, _ in _split_top_level(body, (";",))]
        pieces, start = [], 0
        for k, cut in enumerate(cuts):
            stmt = body[start:cut]
            pieces.append((_instrument_assert(stmt, m.group(1), k) or stmt) + ";")
            start = cut + 1
        pieces.append(body[start:])
        out += [hidden_tests[pos:m.end()], "".join(pieces), "}"]
        pos = close + 1
    out.append(hidden_tests[pos:])
    return "".join(out)


def parse_pytest_pertest(stdout: str, hidden_tests: str) -> list[dict]:
    """Per-test results from `jac test -v` stdout, in declaration order:
    [{"name", "passed": bool | None, "error"?, "actual"?}]. `passed` is None
    when the test never reported a verdict (collection/import failure)."""
    verdict: dict[str, str] = {}
    for rx in _PYTEST_VERDICT_RES:
        for m in rx.finditer(stdout or ""):
            status, name = m.groups() if m.group(1) in ("PASSED", "FAILED", "ERROR") else m.groups()[::-1]
            if verdict.get(name) not in ("FAILED", "ERROR"):
                verdict[name] = status

    errors: dict[str, str] = {}
    section = None
    for line in (stdout or "").splitlines():
        head = _PYTEST_SECTION_RE.match(line)
        if head:
            section = head.group(1)
        elif line.startswith("=") and "short test summary" in line:
            section = None
        elif section and line.startswith("E   ") and section not in errors:
            errors[section] = line[4:].strip()[:300]
    actuals = {m.group(1): m.group(3)[:_ACTUAL_LIMIT] for m in _ACTUAL_RE.finditer(stdout or "")}

    rows = []
    for name in _TEST_NAME_RE.findall(hidden_tests or ""):
        v = verdict.get(name)
        row: dict[str, Any] = {"name": name, "passed": None if v is None else v == "PASSED"}
        if v in ("FAILED", "ERROR"):
            err = errors.get(name, "")
            if err:
                row["error"] = err
            # The last @@ACTUAL is the failing assert only if it failed as an
            # assert; on an exception it belongs to an earlier, passing one.
            if name in actuals and err.startswith("AssertionError"):
                row["actual"] = actuals[name]
        rows.append(row)
    return rows


_LOG_LIMIT = 256 * 1024


def write_log(log_dir: Path | None, problem_id: str, sample_id: Any,
              stages: list[tuple[str, "ProcessResult"]]) -> None:
    """Full stdout/stderr of each jac stage (tail-capped); holds hidden-test text."""
    if log_dir is None:
        return
    parts = []
    for stage, res in stages:
        parts.append(f"===== {stage} rc={res.returncode} timed_out={res.timed_out} =====\n")
        for label, text in (("stdout", res.stdout), ("stderr", res.stderr)):
            parts.append(f"----- {label} -----\n{(text or '')[-_LOG_LIMIT:]}\n")
    (log_dir / f"{problem_id}__{sample_id}.log").write_text("".join(parts), encoding="utf-8")


_SYSTEMD_RUN = shutil.which("systemd-run")
_SCOPES_OK: bool | None = None


def _systemd_scopes_available() -> bool:
    """True iff `systemd-run --user --scope` actually works here (probed once).

    Containers (e.g. RunPod, init = docker-init) ship the binary but have no
    user bus, so every wrapped command would fail to launch.
    """
    global _SCOPES_OK
    if _SCOPES_OK is None:
        _SCOPES_OK = bool(_SYSTEMD_RUN) and subprocess.run(
            [_SYSTEMD_RUN, "--user", "--scope", "--quiet", "--collect", "true"],
            capture_output=True, timeout=15,
        ).returncode == 0
    return _SCOPES_OK


_PAGE = os.sysconf("SC_PAGE_SIZE")


def _group_rss_bytes(pgid: int) -> int:
    """Resident memory summed over every live process in process group `pgid`.

    Fallback memory cap when cgroup scopes are unavailable. RLIMIT_AS can't be
    used: the jac runtime reserves enough virtual address space for its threads
    that a 12GB RLIMIT_AS fails `start_new_thread` before any real allocation.
    """
    total = 0
    for entry in os.scandir("/proc"):
        if not entry.name.isdigit():
            continue
        try:
            with open(f"/proc/{entry.name}/stat") as f:
                fields = f.read().rsplit(")", 1)[1].split()
            if int(fields[2]) != pgid:            # fields after comm: state ppid pgrp ...
                continue
            with open(f"/proc/{entry.name}/statm") as f:
                total += int(f.read().split()[1]) * _PAGE
        except (OSError, IndexError, ValueError):
            continue                               # process exited mid-scan
    return total


def _wrap_with_cgroup(command: list[str], mem_limit_bytes: int) -> list[str]:
    """Wrap a command in its own transient systemd user scope with MemoryMax.

    RLIMIT_AS only caps a single process's address space; a `jac test` that
    forks N workers (embedded postgres, jaclang workers) then gets N × cap.
    A per-test cgroup covers the entire process tree, so a runaway sample is
    OOM-killed inside its own scope and everything else keeps running.
    """
    if not _systemd_scopes_available() or mem_limit_bytes <= 0:
        return command
    gb = mem_limit_bytes / (1 << 30)
    high = int(mem_limit_bytes * 0.9)
    return [
        _SYSTEMD_RUN, "--user", "--scope", "--quiet", "--collect",
        "--property", f"MemoryMax={mem_limit_bytes}",
        "--property", f"MemoryHigh={high}",
        "--property", "MemorySwapMax=0",  # no swap, otherwise cap is soft
        "--property", "OOMPolicy=kill",   # kill the whole scope on OOM
        *command,
    ]


def run_process(
    command: list[str], cwd: Path, timeout_s: float, env: dict[str, str],
    mem_limit_bytes: int | None = None,
) -> ProcessResult:
    start = time.perf_counter()
    rss_cap = None
    if mem_limit_bytes:
        if _systemd_scopes_available():
            command = _wrap_with_cgroup(command, mem_limit_bytes)
        else:
            rss_cap = mem_limit_bytes          # polled below; the group is killed on breach
    try:
        process = subprocess.Popen(
            command,
            cwd=str(cwd),
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            start_new_session=True,
        )
    except OSError as exc:
        return ProcessResult(
            None, "", "", (time.perf_counter() - start) * 1000, launch_error=str(exc)
        )

    try:
        if rss_cap is None:
            stdout, stderr = process.communicate(timeout=timeout_s)
        else:
            deadline = start + timeout_s
            while True:
                try:
                    stdout, stderr = process.communicate(timeout=0.5)
                    break
                except subprocess.TimeoutExpired:
                    if time.perf_counter() >= deadline:
                        raise
                    if _group_rss_bytes(process.pid) > rss_cap:
                        # Same shape as a cgroup OOM kill: returncode -9, classified
                        # by the caller as test_fail / fail_reason=memory_cap.
                        os.killpg(process.pid, signal.SIGKILL)
                        stdout, stderr = process.communicate()
                        return ProcessResult(
                            process.returncode, stdout,
                            (stderr or "") + "\n[grader] killed: process group RSS over memory cap",
                            (time.perf_counter() - start) * 1000,
                        )
        return ProcessResult(
            process.returncode,
            stdout,
            stderr,
            (time.perf_counter() - start) * 1000,
        )
    except subprocess.TimeoutExpired:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        stdout, stderr = process.communicate()
        return ProcessResult(
            process.returncode,
            stdout,
            stderr,
            (time.perf_counter() - start) * 1000,
            timed_out=True,
        )


def concise_output(result: ProcessResult, limit: int = 600) -> str:
    text = (result.stderr or result.stdout).strip()
    return text[-limit:]


def is_infra_failure(result: ProcessResult) -> bool:
    return bool(INFRA_ERROR_RE.search((result.stdout or "") + "\n" + (result.stderr or "")))


def infra_excerpt(result: ProcessResult, limit: int = 600) -> str:
    text = ((result.stdout or "") + "\n" + (result.stderr or "")).strip()
    match = INFRA_ERROR_RE.search(text)
    if not match:
        return text[-limit:]
    start = max(0, match.start() - limit // 4)
    return text[start : start + limit]


def set_infra_error(
    row: dict[str, Any], *, stage: str, error: str, returncode: int | None = None
) -> None:
    row.update(
        status="infra_error",
        stage=stage,
        error=error,
        returncode=returncode,
        test_pass=None,
        task_success=None,
    )


def entrypoints(problem: dict[str, Any]) -> list[str]:
    """Entrypoint names for the annex import header (empty if unknown)."""
    value = problem.get("entrypoint")
    if value is None:
        return []
    if isinstance(value, str):
        value = [value]
    return [str(item).strip() for item in value if str(item).strip()]


def grade_one(
    index: int,
    problem: dict[str, Any],
    sample: dict[str, Any],
    *,
    jac_bin: str,
    timeout_s: float,
    tmp_root: Path | None,
    jac_tmp: Path | None,
    per_test_mem_bytes: int | None = None,
    server_codespace: bool = True,
    stages: list[tuple[str, ProcessResult]] | None = None,
) -> tuple[int, dict[str, Any]]:
    problem_id = str(problem["id"])
    sample_id = sample.get("sample_id", index)
    hidden_tests = test_blocks(problem)
    has_behavior_tests = bool(hidden_tests)
    row: dict[str, Any] = {
        "problem_id": problem_id,
        "sample_id": sample_id,
        "track": problem.get("track", "function"),
        "status": None,
        "check_pass": False,
        "has_behavior_tests": has_behavior_tests,
        "test_executed": False,
        "test_pass": False if has_behavior_tests else None,
        "task_success": False if has_behavior_tests else None,
    }

    source, extraction_error = assemble_source(problem, sample)
    if extraction_error or source is None:
        row.update(status="extract_fail", error=extraction_error)
        return index, row

    row["source_sha256"] = hashlib.sha256(source.encode()).hexdigest()
    diagnostics = static_diagnostics(source)
    row["static"] = diagnostics
    contract_pass, missing, forbidden = validate_contract(problem, diagnostics["features"])
    row["contract_pass"] = contract_pass
    if missing:
        row["missing_features"] = missing
    if forbidden:
        row["forbidden_features_present"] = forbidden
    references = reference_diagnostics(problem, source)
    if references:
        row["reference"] = references

    tmp_parent = str(tmp_root) if tmp_root else None
    with tempfile.TemporaryDirectory(prefix=f"jac_eval_{problem_id}_", dir=tmp_parent) as tmp:
        cwd = Path(tmp)
        env = dict(os.environ)
        if jac_tmp is not None:
            env["TMPDIR"] = str(jac_tmp)
        candidate_file = cwd / "candidate.jac"
        candidate_file.write_text(source.rstrip() + "\n", encoding="utf-8")

        checked = run_process(
            [jac_bin, "check", str(candidate_file)], cwd, timeout_s, env
        )
        row["check_ms"] = round(checked.elapsed_ms, 1)
        if stages is not None:
            stages.append(("check", checked))
        if checked.launch_error:
            set_infra_error(row, stage="check", error=checked.launch_error)
            return index, row
        if checked.timed_out:
            row.update(status="timeout", stage="check", error=concise_output(checked))
            return index, row
        if checked.returncode is None or checked.returncode < 0:
            row.update(
                status="tool_crash",
                stage="check",
                returncode=checked.returncode,
                error=concise_output(checked),
            )
            return index, row
        if checked.returncode != 0:
            if is_infra_failure(checked):
                set_infra_error(
                    row,
                    stage="check",
                    error=infra_excerpt(checked),
                    returncode=checked.returncode,
                )
            else:
                row.update(
                    status="check_fail",
                    returncode=checked.returncode,
                    error=concise_output(checked),
                )
            return index, row

        row["check_pass"] = True
        if not hidden_tests:
            row["status"] = "check_pass"
            return index, row

        names = entrypoints(problem)
        if names:
            # Annex mode: hidden tests import the candidate as a separate
            # module. This is the layout the 0.36 test runner supports and the
            # one scripts/eval/validate_task.py uses for jac_native tasks.
            header = f"import from candidate {{ {', '.join(names)} }}\n"
            test_file = cwd / "tests.jac"
            test_file.write_text(header + instrument_tests(hidden_tests).rstrip() + "\n", encoding="utf-8")
        else:
            # Legacy fallback when no entrypoint is declared.
            test_file = cwd / "guard.jac"
            test_file.write_text(
                source.rstrip() + "\n\n" + instrument_tests(hidden_tests).rstrip() + "\n",
                encoding="utf-8",
            )
        if server_codespace:
            (cwd / "jac.toml").write_text(JAC_TOML_SERVER, encoding="utf-8")
        tested = run_process(
            [jac_bin, "test", "-v", str(test_file)], cwd, timeout_s, env,
            mem_limit_bytes=per_test_mem_bytes,
        )
        if stages is not None:
            stages.append(("test", tested))
        row["test_executed"] = True
        row["test_ms"] = round(tested.elapsed_ms, 1)
        # JacCoder patch: per-test results + actual values. See PROVENANCE.md.
        row["per_test"] = parse_pytest_pertest(tested.stdout, hidden_tests)
        if tested.launch_error:
            set_infra_error(row, stage="test", error=tested.launch_error)
            return index, row
        if tested.timed_out:
            row.update(status="timeout", stage="test", test_pass=False, error=concise_output(tested))
            return index, row
        if tested.returncode is None or tested.returncode < 0 or tested.returncode in (137, 139):
            # A per-test memory cap trip surfaces as either a direct signal
            # (returncode < 0, e.g. -9/-11) on the jac child, or as 137/139
            # when systemd-run reports its OOM-killed scope payload. Classify
            # either as test_fail (WA) so a runaway sample counts against the
            # submission, not the tool.
            mem_killed = (
                per_test_mem_bytes is not None
                and tested.returncode in (-9, -11, 137, 139)
            )
            row.update(
                status="test_fail" if mem_killed else "tool_crash",
                stage="test",
                test_pass=False,
                returncode=tested.returncode,
                error=concise_output(tested) or ("killed by memory cap" if mem_killed else ""),
            )
            if mem_killed:
                row["fail_reason"] = "memory_cap"
            return index, row
        if tested.returncode != 0:
            if is_infra_failure(tested):
                set_infra_error(
                    row,
                    stage="test",
                    error=infra_excerpt(tested),
                    returncode=tested.returncode,
                )
            else:
                row.update(
                    status="test_fail",
                    test_pass=False,
                    returncode=tested.returncode,
                    error=concise_output(tested),
                )
            return index, row

        row.update(
            status="pass" if contract_pass else "contract_fail",
            test_pass=True,
            task_success=contract_pass,
        )
        return index, row


def pass_at_k(n: int, correct: int, k: int) -> float | None:
    if n < k or n <= 0:
        return None
    if correct <= 0:
        return 0.0
    if n - correct < k:
        return 1.0
    return 1.0 - math.comb(n - correct, k) / math.comb(n, k)


def mean(values: Iterable[float]) -> float | None:
    items = list(values)
    return round(sum(items) / len(items), 6) if items else None


def aggregate(rows: list[dict[str, Any]], ks: list[int]) -> dict[str, Any]:
    status_counts = Counter(str(row["status"]) for row in rows)
    tested = [
        row
        for row in rows
        if row.get("has_behavior_tests") and row.get("status") != "infra_error"
    ]
    scored = [row for row in rows if row.get("task_success") is not None]

    grouped: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in scored:
        grouped[str(row["problem_id"])].append(row)

    pass_k: dict[str, Any] = {}
    for k in ks:
        estimates: list[float] = []
        for samples in grouped.values():
            n = len(samples)
            correct = sum(bool(sample["task_success"]) for sample in samples)
            estimate = pass_at_k(n, correct, k)
            if estimate is not None:
                estimates.append(estimate)
        pass_k[str(k)] = {
            "value": mean(estimates),
            "eligible_problems": len(estimates),
        }

    static_rows = [row["static"] for row in rows if isinstance(row.get("static"), dict)]
    feature_counts: Counter[str] = Counter()
    feature_names: set[str] = set()
    for diagnostics in static_rows:
        flags = diagnostics.get("features", {})
        feature_names.update(flags)
        for name, present in flags.items():
            if present and not name.startswith("no_"):
                feature_counts[name] += 1

    def feature_rate(name: str) -> float | None:
        return mean(
            bool(diagnostics.get("features", {}).get(name))
            for diagnostics in static_rows
        )

    def diagnostic_mean(name: str) -> float | None:
        return mean(
            float(diagnostics.get(name, 0))
            for diagnostics in static_rows
        )

    static_summary = {
        "typing": {
            "typed_def_rate": feature_rate("typed_def"),
            "no_dynamic_types_rate": feature_rate("no_dynamic_types"),
            "mean_dynamic_type_mentions": diagnostic_mean("dynamic_type_mentions"),
        },
        "transpiler_residue": {
            "no_python_syntax_rate": feature_rate("no_python_syntax"),
            "no_import_py_rate": feature_rate("no_import_py"),
            "no_embedded_test_blocks_rate": feature_rate("no_test_blocks"),
            "mean_range_len_loops": diagnostic_mean("range_len_loops"),
        },
        "readability_diagnostics": {
            "mean_source_lines": diagnostic_mean("source_lines"),
            "mean_line_length": diagnostic_mean("mean_line_length"),
            "mean_long_lines_over_100": diagnostic_mean("long_lines_over_100"),
            "mean_max_brace_depth": diagnostic_mean("max_brace_depth"),
        },
        "feature_rates": {
            name: feature_rate(name) for name in sorted(feature_names)
        },
        "note": "reported independently; no aggregate idiomaticity score",
    }

    problem_ids = {str(row["problem_id"]) for row in rows}
    return {
        "problems": len(problem_ids),
        "samples": len(rows),
        "complete": status_counts.get("infra_error", 0) == 0,
        "infra_errors": status_counts.get("infra_error", 0),
        "status_counts": dict(sorted(status_counts.items())),
        "check_rate": mean(bool(row.get("check_pass")) for row in rows),
        "behavior_test_rate": mean(bool(row.get("test_pass")) for row in tested),
        "task_success_rate": mean(bool(row.get("task_success")) for row in scored),
        "contract_rate": mean(bool(row.get("contract_pass")) for row in rows),
        "pass_at_k": pass_k,
        "feature_presence_samples": dict(sorted(feature_counts.items())),
        "static_diagnostics": static_summary,
        "compile_only_samples": sum(
            not row.get("has_behavior_tests") for row in rows
        ),
    }


def validate_inputs(
    problems: list[dict[str, Any]], samples: list[dict[str, Any]]
) -> dict[str, dict[str, Any]]:
    by_id: dict[str, dict[str, Any]] = {}
    for problem in problems:
        if "id" not in problem:
            raise ValueError("every problem requires an id")
        problem_id = str(problem["id"])
        if problem_id in by_id:
            raise ValueError(f"duplicate problem id: {problem_id}")
        track = str(problem.get("track", "function"))
        if track not in {"function", "osp"}:
            raise ValueError(f"problem {problem_id!r}: track must be function or osp")
        problem["track"] = track
        # Validate contract names before spending time on Jac subprocesses.
        validate_contract(problem, {name: False for name in FEATURE_PATTERNS})
        by_id[problem_id] = problem

    for index, sample in enumerate(samples):
        if "problem_id" not in sample:
            raise ValueError(f"sample {index} requires problem_id")
        problem_id = str(sample["problem_id"])
        if problem_id not in by_id:
            raise ValueError(f"sample {index} refers to unknown problem {problem_id!r}")
    return by_id


def jac_version(jac_bin: str) -> str | None:
    try:
        result = subprocess.run(
            [jac_bin, "--version"], capture_output=True, text=True, timeout=15  # sandbox-exempt: read-only probe
        )
    except (OSError, subprocess.TimeoutExpired):
        return None
    text = (result.stdout or result.stderr).strip()
    return text or None


def parse_ks(value: str) -> list[int]:
    try:
        ks = sorted({int(item) for item in value.split(",") if item.strip()})
    except ValueError as exc:
        raise argparse.ArgumentTypeError("--k must be comma-separated integers") from exc
    if not ks or any(k <= 0 for k in ks):
        raise argparse.ArgumentTypeError("--k values must be positive")
    return ks


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--problems", type=Path, required=True)
    parser.add_argument("--samples", type=Path, required=True)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--jac-bin", default="jac")
    parser.add_argument("--timeout", type=float, default=120.0)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--k", type=parse_ks, default=parse_ks("1,5,10"))
    parser.add_argument(
        "--tmp-root", type=Path, help="parent for isolated per-sample working directories"
    )
    parser.add_argument(
        "--jac-tmp",
        type=Path,
        help="optional shared Jac runtime TMPDIR; default inherits the environment",
    )
    parser.add_argument(
        "--per-test-mem-gb",
        type=float, default=12.0,
        help="memory cap (GB) on each `jac test` process group (cgroup scope, or an RSS "
             "watchdog where scopes are unavailable); runaways are killed "
             "by the kernel and land as test_fail (WA). 0 disables the cap.",
    )
    parser.add_argument(
        "--native-codespace",
        action="store_true",
        help="keep the default native codespace instead of pinning server for tests",
    )
    parser.add_argument(
        "--no-logs",
        action="store_true",
        help="skip <out-dir>/logs/<problem>__<sample>.log (full jac stdout/stderr; "
             "contains hidden-test text)",
    )
    args = parser.parse_args()

    if args.timeout <= 0:
        parser.error("--timeout must be positive")
    if args.workers <= 0:
        parser.error("--workers must be positive")
    if args.tmp_root:
        args.tmp_root.mkdir(parents=True, exist_ok=True)
    jac_tmp = args.jac_tmp
    if jac_tmp is not None:
        jac_tmp.mkdir(parents=True, exist_ok=True)

    problems = read_jsonl(args.problems)
    samples = read_jsonl(args.samples)
    by_id = validate_inputs(problems, samples)
    args.out_dir.mkdir(parents=True, exist_ok=True)
    log_dir = None if args.no_logs else args.out_dir / "logs"
    if log_dir is not None:
        log_dir.mkdir(exist_ok=True)

    def graded(index: int, problem: dict[str, Any], sample: dict[str, Any], **kwargs):
        stages: list[tuple[str, ProcessResult]] = []
        try:
            return grade_one(index, problem, sample, stages=stages, **kwargs)
        finally:
            write_log(log_dir, str(problem["id"]), sample.get("sample_id", index), stages)

    started = time.perf_counter()
    ordered: list[dict[str, Any] | None] = [None] * len(samples)
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(
                graded,
                index,
                by_id[str(sample["problem_id"])],
                sample,
                jac_bin=args.jac_bin,
                timeout_s=args.timeout,
                tmp_root=args.tmp_root,
                jac_tmp=jac_tmp,
                per_test_mem_bytes=(
                    int(args.per_test_mem_gb * (1 << 30))
                    if args.per_test_mem_gb > 0 else None
                ),
                server_codespace=not args.native_codespace,
            ): index
            for index, sample in enumerate(samples)
        }
        for future in as_completed(futures):
            index, row = future.result()
            ordered[index] = row

    results = [row for row in ordered if row is not None]
    results_path = args.out_dir / "results.jsonl"
    results_path.write_text(
        "".join(json.dumps(row, sort_keys=True) + "\n" for row in results),
        encoding="utf-8",
    )

    overall = aggregate(results, args.k)
    tracks = {
        track: aggregate([row for row in results if row["track"] == track], args.k)
        for track in ("function", "osp")
        if any(row["track"] == track for row in results)
    }
    summary = {
        "schema_version": 1,
        "created_at": datetime.now(timezone.utc).isoformat(),
        "elapsed_s": round(time.perf_counter() - started, 3),
        "jac_version": jac_version(args.jac_bin),
        "configuration": {
            "timeout_s": args.timeout,
            "workers": args.workers,
            "k": args.k,
            "jac_tmp": str(jac_tmp.resolve()) if jac_tmp else None,
            "problems_sha256": sha256_file(args.problems),
            "samples_sha256": sha256_file(args.samples),
        },
        "overall": overall,
        "tracks": tracks,
        "notes": [
            "task_success requires hidden tests and any declared feature contract",
            "compile-only samples do not contribute to task_success or pass@k",
            "feature presence and reference similarity are diagnostics, not idiomaticity scores",
        ],
    }
    summary_path = args.out_dir / "summary.json"
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")

    print(json.dumps(overall, indent=2, sort_keys=True))
    print(f"wrote {results_path}")
    print(f"wrote {summary_path}")
    if not overall["complete"]:
        print("evaluation incomplete: resolve and rerun infrastructure errors")
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
