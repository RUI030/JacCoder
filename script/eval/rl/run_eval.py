"""RL task eval: sample n completions per task, grade them with rl.graders, report pass@k and per-task pass counts.

    python script/eval/rl/run_eval.py --adapter output/adapter/<run>/adapter --split dev
    python script/eval/rl/run_eval.py --adapter <sft adapter> --split train --n-samples 8 --temperature 0.8   # RL readiness
    python script/eval/rl/run_eval.py --regrade output/eval/rl/<task>/<set>/<run>    # re-grade saved predictions, no GPU
"""
import argparse, json, sys, time
from datetime import datetime
from math import comb
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils import jac_cli
from utils.model import load_model, generate_batched
from dataset.pipeline import load_prompts
from rl.graders import grade_many
from rl.task import load_split, to_dataset

# Setting =================================================
TASK          = "functions"
SET_NAME      = "spike-sample-20"
SPLIT         = "dev"
BASE_MODEL    = "ornith-ai/Ornith-1.5-9B"
ADAPTER_PATH  = ""                 # empty => base model only
TAG           = ""                 # empty => derived from the adapter path

MAX_SEQ_LENGTH  = 4096
N_SAMPLES       = 8
TEMPERATURE     = 0.8              # same sampling as GRPO rollouts
TOP_P           = 1.0
REPETITION_PENALTY = 1.0
MAX_NEW_TOKENS  = 768
GEN_BATCH       = 32               # sequences per generate call
K               = [1, 8]
LIMIT           = 0                # 0 => all tasks in the split
WORKERS         = 8
GRADE_TIMEOUT   = 30
GRADE_MEM_GB    = 3
EMIT_SPLIT      = False            # write splits/<split>_active.txt (tasks with 0 < passes < n)
REGRADE         = ""               # an existing run dir: grade its predictions.jsonl again (grader or tests changed)
SEED            = 3407

# CLI overrides ============================================
cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--task", dest="task")
cli.add_argument("--set", "--ds", dest="set_name")
cli.add_argument("--split", dest="split")
cli.add_argument("--adapter", "--adapter-path", dest="adapter")
cli.add_argument("--tag", dest="tag")
cli.add_argument("--n-samples", dest="n", type=int)
cli.add_argument("--temperature", type=float)
cli.add_argument("--max-new-tokens", dest="max_new", type=int)
cli.add_argument("--k", help="comma list, e.g. 1,8")
cli.add_argument("--limit", type=int)
cli.add_argument("--workers", type=int)
cli.add_argument("--emit-split", dest="emit", action="store_true")
cli.add_argument("--regrade", help="existing run dir to re-grade from its predictions.jsonl")
args, _ = cli.parse_known_args()
if args.task:                    TASK           = args.task
if args.set_name:                SET_NAME       = args.set_name
if args.split:                   SPLIT          = args.split
if args.adapter is not None:     ADAPTER_PATH   = args.adapter
if args.tag:                     TAG            = args.tag
if args.n:                       N_SAMPLES      = args.n
if args.temperature is not None: TEMPERATURE    = args.temperature
if args.max_new:                 MAX_NEW_TOKENS = args.max_new
if args.k:                       K              = [int(k) for k in args.k.split(",")]
if args.limit is not None:       LIMIT          = args.limit
if args.workers:                 WORKERS        = args.workers
if args.emit:                    EMIT_SPLIT     = True
if args.regrade:                 REGRADE        = args.regrade

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent
SET_DIR  = PROJECT_ROOT / "dataset" / "rl" / TASK / SET_NAME
PROMPT   = PROJECT_ROOT / "script" / "dataset" / "template" / "prompt_template.json"
# output/adapter/<run>/sft/adapter → "<run>-sft"; output/adapter/<run>/adapter → "<run>"
TAG      = TAG or ("-".join(Path(ADAPTER_PATH).parts[-3:-1]).removeprefix("adapter-")
                   if ADAPTER_PATH else BASE_MODEL.replace("/", "_"))
STAMP    = datetime.now().strftime("%m-%d_%H-%M")
OUT_DIR  = PROJECT_ROOT / "output" / "eval" / "rl" / TASK / SET_NAME / f"{TAG}_{SPLIT}_{STAMP}"


# Functions ===============================================
def pass_at_k(n: int, c: int, k: int) -> float:
    """Unbiased pass@k from n samples with c correct (Chen et al. 2021)."""
    if n - c < k:
        return 1.0
    return 1.0 - comb(n - c, k) / comb(n, k)


def generate(model, tokenizer, rows: list[dict]) -> list[dict]:
    """N_SAMPLES completions per task row, as predictions.jsonl records (eval/infer schema + sample_id)."""
    jobs = [(r, s) for r in rows for s in range(N_SAMPLES)]
    preds = []
    for i in range(0, len(jobs), GEN_BATCH):
        chunk = jobs[i:i + GEN_BATCH]
        replies = generate_batched(
            model, tokenizer, [r["prompt"] for r, _ in chunk],
            max_new_tokens=MAX_NEW_TOKENS, temperature=TEMPERATURE,
            top_p=TOP_P, repetition_penalty=REPETITION_PENALTY,
        )
        for (r, s), reply in zip(chunk, replies):
            preds.append({"id": r["task_id"], "sample_id": s, "prediction": reply, "reference": "",
                          "meta": {"task_dir": r["task_dir"], "task_type": r["task_type"]}})
        print(f"  generated {len(preds)}/{len(jobs)}")
    return preds


def grade(preds: list[dict]) -> tuple[list[dict], dict[str, float]]:
    """Grade one task's samples per grade_many call, as a GRPO step grades a group; time each group."""
    results, group_s = [], {}
    by_task: dict[str, list[dict]] = {}
    for p in preds:
        by_task.setdefault(p["id"], []).append(p)
    for tid, group in by_task.items():
        start = time.perf_counter()
        rows = grade_many([(p["prediction"], p["meta"]["task_dir"]) for p in group],
                          WORKERS, GRADE_TIMEOUT, GRADE_MEM_GB)
        group_s[tid] = time.perf_counter() - start
        results += [{"id": tid, "sample_id": p["sample_id"], **row} for p, row in zip(group, rows)]
    return results, group_s


def summarize(results: list[dict], group_s: dict[str, float]) -> dict:
    """pass@k, compile/format rates, per-task pass counts and the GRPO-signal fractions."""
    per_task = {}
    for tid in group_s:
        rows = [r for r in results if r["id"] == tid]
        rewards = [r["reward"] for r in rows if r["reward"] is not None]
        per_task[tid] = {"passes": sum(r["status"] == "pass" for r in rows), "n": len(rows),
                         "mean_reward": round(sum(rewards) / max(len(rewards), 1), 3),
                         "reward_varies": len(set(rewards)) > 1,
                         "grade_s": round(group_s[tid], 1)}
    n_tasks = len(per_task)
    status: dict[str, int] = {}
    for r in results:
        status[r["status"]] = status.get(r["status"], 0) + 1
    return {
        "adapter": ADAPTER_PATH, "set": f"{TASK}/{SET_NAME}", "split": SPLIT,
        "n_samples": N_SAMPLES, "temperature": TEMPERATURE, "max_new_tokens": MAX_NEW_TOKENS,
        "pass_at_k": {f"pass@{k}": round(sum(pass_at_k(t["n"], t["passes"], k) for t in per_task.values()) / n_tasks, 4)
                      for k in K if k <= N_SAMPLES},
        "compile_rate": round(sum(r["check_pass"] for r in results) / len(results), 4),
        "format_rate":  round(sum(r["status"] != "format_fail" for r in results) / len(results), 4),
        "mean_reward":  round(sum(t["mean_reward"] for t in per_task.values()) / n_tasks, 4),
        "mixed_pass_frac":   round(sum(0 < t["passes"] < t["n"] for t in per_task.values()) / n_tasks, 4),
        "reward_varies_frac": round(sum(t["reward_varies"] for t in per_task.values()) / n_tasks, 4),
        "grade_s_per_group": {"mean": round(sum(group_s.values()) / n_tasks, 1), "max": round(max(group_s.values()), 1)},
        "status": status,
        "per_task": per_task,
    }


def regrade(run_dir: Path) -> dict:
    """Grade a run's saved predictions again; keep the old results as results.prev.jsonl.

    The run's generation settings (adapter, split, n, temperature, ...) come from its old
    summary.json; only the grading fields are recomputed.
    """
    preds = [json.loads(l) for l in open(run_dir / "predictions.jsonl")]
    old = json.loads((run_dir / "summary.json").read_text())
    (run_dir / "results.jsonl").rename(run_dir / "results.prev.jsonl")
    results, group_s = grade(preds)
    write_jsonl(run_dir / "results.jsonl", results)
    keep = ("adapter", "set", "split", "n_samples", "temperature", "max_new_tokens", "generate_s")
    summary = {**summarize(results, group_s), **{k: old[k] for k in keep if k in old},
               "regraded": datetime.now().strftime("%m-%d_%H-%M")}
    (run_dir / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    return summary


def write_jsonl(path: Path, rows: list[dict]) -> None:
    with path.open("w", encoding="utf-8") as f:
        for r in rows:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")


# Run =====================================================
if __name__ == "__main__" and REGRADE:
    jac_cli.purge_pg()
    jac_cli.start_pg()                   # postgres outside any per-test cgroup scope
    summary = regrade(Path(REGRADE))
    jac_cli.purge_pg()
    print(json.dumps({k: v for k, v in summary.items() if k != "per_task"}, indent=2))

elif __name__ == "__main__":
    tasks = load_split(SET_DIR, SPLIT)[: LIMIT or None]
    rows  = list(to_dataset(tasks, load_prompts(PROMPT, "system", "rl_functions"), SEED))
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    print(f"{len(rows)} tasks × {N_SAMPLES} samples → {OUT_DIR}")

    model, tokenizer = load_model(ADAPTER_PATH or BASE_MODEL, MAX_SEQ_LENGTH)
    start = time.perf_counter()
    preds = generate(model, tokenizer, rows)
    gen_s = time.perf_counter() - start
    write_jsonl(OUT_DIR / "predictions.jsonl", preds)

    jac_cli.purge_pg()
    jac_cli.start_pg()                   # postgres outside any per-test cgroup scope
    results, group_s = grade(preds)
    jac_cli.purge_pg()
    write_jsonl(OUT_DIR / "results.jsonl", results)

    summary = {**summarize(results, group_s), "generate_s": round(gen_s)}
    (OUT_DIR / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    if EMIT_SPLIT:
        active = [t for t, v in summary["per_task"].items() if 0 < v["passes"] < v["n"]]
        (SET_DIR / "splits" / f"{SPLIT}_active.txt").write_text("\n".join(active) + "\n")
    print(json.dumps({k: v for k, v in summary.items() if k != "per_task"}, indent=2))
    print("per task passes:", " ".join(f"{t}={v['passes']}/{v['n']}" for t, v in summary["per_task"].items()))
