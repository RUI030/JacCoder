"""CLI: consume model grader results + per-task-type refs → tables + per-sample JSONL.

Usage
-----
    python -m script.eval.Nitin-test.report.build_report \
        --model-results out/<model_run>/results.jsonl \
        --refs-completion  out/refs_reference_completion_test_.../results.jsonl \
        --refs-translation out/refs_idiomatic_jac_test_.../results.jsonl \
        --public data/function/v1/public/test.jsonl \
        --out out/report_v12/

Outputs (under --out):
    report.md            markdown tables + partial-pass buckets
    per_sample.jsonl     one row per model sample (attribution + counts)
    summary.json         machine-readable form of report.md tables
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

# `Nitin-test/` has a dash → not importable as a package. Run as a plain
# script and load siblings from the same folder.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from attribute  import attribute, CATEGORIES        # noqa: E402
from metrics    import summarize, split_by_task     # noqa: E402
from merge_refs import load_refs                    # noqa: E402
from render     import render_full_report           # noqa: E402


def read_jsonl(path: Path) -> list[dict]:
    with path.open("r", encoding="utf-8") as f:
        return [json.loads(line) for line in f if line.strip()]


def task_map(public_fp: Path) -> dict[str, str]:
    """problem_id → 'completion' | 'translation'."""
    return {row["id"]: row["task"] for row in read_jsonl(public_fp)}


def per_test_counts(row: dict) -> tuple[int, int]:
    pt = row.get("per_test") or []
    return sum(1 for t in pt if t.get("passed")), len(pt)


def assemble(
    model_rows: list[dict],
    refs: dict[str, dict],
    tasks: dict[str, str],
) -> list[dict]:
    """Produce per-sample rows for metrics + JSONL output."""
    out: list[dict] = []
    for m in model_rows:
        pid = m["problem_id"]
        ref = refs.get(pid)
        cat = attribute(m, ref)
        passed, total = per_test_counts(m)
        status = m.get("status")
        compile_ok = bool(m.get("check_pass")) and status != "extract_fail"
        runtime_ok = status not in ("timeout", "infra_error", "extract_fail",
                                     "check_fail")
        out.append({
            "problem_id":   pid,
            "task":         tasks.get(pid, "unknown"),
            "status":       status,
            "attribution":  cat,
            "passed_tests": passed,
            "total_tests":  total,
            "compile_ok":   compile_ok,
            "runtime_ok":   runtime_ok,
            "ref_ok":       None if ref is None else (ref.get("status") == "pass"),
        })
    return out


def main():
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument("--model-results",   type=Path, required=True)
    cli.add_argument("--refs-completion", type=Path, default=None,
                     help="wash_refs --field reference_completion results.jsonl")
    cli.add_argument("--refs-translation", type=Path, default=None,
                     help="wash_refs --field idiomatic_jac results.jsonl")
    cli.add_argument("--public", type=Path, required=True,
                     help="public/<split>.jsonl for task-type map")
    cli.add_argument("--out",    type=Path, required=True)
    args = cli.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)

    tasks = task_map(args.public)
    refs = load_refs({
        "completion":  args.refs_completion,
        "translation": args.refs_translation,
    })
    model_rows = read_jsonl(args.model_results)

    rows = assemble(model_rows, refs, tasks)

    per_sample_fp = args.out / "per_sample.jsonl"
    with per_sample_fp.open("w", encoding="utf-8") as f:
        for r in rows:
            json.dump(r, f, ensure_ascii=False)
            f.write("\n")

    by_task = split_by_task(rows)
    tables = {
        "completion":  summarize(by_task.get("completion", [])),
        "translation": summarize(by_task.get("translation", [])),
        "overall":     summarize(rows),
    }

    (args.out / "summary.json").write_text(
        json.dumps(tables, indent=2) + "\n", encoding="utf-8"
    )
    md = render_full_report(tables)
    (args.out / "report.md").write_text(md + "\n", encoding="utf-8")

    print(md)
    print()
    print(f"wrote {per_sample_fp}")
    print(f"wrote {args.out / 'summary.json'}")
    print(f"wrote {args.out / 'report.md'}")


if __name__ == "__main__":
    main()
