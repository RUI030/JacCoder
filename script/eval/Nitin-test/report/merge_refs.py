"""Combine per-task-type reference grader outputs into one map.

Completion refs come from `wash_refs --field reference_completion` (only
completion tasks have that field). Translation refs come from
`wash_refs --field idiomatic_jac` (translation tasks have only that field).

Usage:
    refs = load_refs({
        "completion":  Path("out/refs_reference_completion_test_.../results.jsonl"),
        "translation": Path("out/refs_idiomatic_jac_test_.../results.jsonl"),
    })
    ref_row = refs.get(problem_id)   # None if that task_id was not graded
"""

from __future__ import annotations

import json
from pathlib import Path


def _read_jsonl(path: Path) -> list[dict]:
    with path.open("r", encoding="utf-8") as f:
        return [json.loads(line) for line in f if line.strip()]


def load_refs(paths_by_task: dict[str, Path]) -> dict[str, dict]:
    """Load one or more refs results.jsonl files. Returns
    problem_id → grader-row. If the same problem_id appears in more than
    one file, the later one wins (caller controls order via dict order)."""
    out: dict[str, dict] = {}
    for task, fp in paths_by_task.items():
        if fp is None:
            continue
        for row in _read_jsonl(fp):
            out[row["problem_id"]] = row
    return out
