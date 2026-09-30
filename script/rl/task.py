"""Load an RL task set (dataset/rl/<task>/<set>/) into task dicts and an HF Dataset."""

import json, random
from functools import cache
from pathlib import Path

from datasets import Dataset

from rl.harness import render_prompt

# Setting =================================================
SPLITS = ["train", "dev", "test"]
SEED   = 3407


# Functions ===============================================
@cache
def set_meta(set_dir: str | Path) -> dict:
    """The set's meta.json: fields shared by every task, plus `tasks: {id: per-task fields}`."""
    return json.loads((Path(set_dir) / "meta.json").read_text())


def task_meta(task_dir: str | Path) -> dict:
    """One task's meta: the set's shared fields merged with its own entry and its id."""
    task_dir = Path(task_dir)
    meta = set_meta(task_dir.parent.parent)
    shared = {k: v for k, v in meta.items() if k != "tasks"}
    return {"id": task_dir.name, **shared, **meta["tasks"][task_dir.name]}


def check_splits(set_dir: str | Path) -> None:
    """Every task id must have a meta entry and be in exactly one split file."""
    set_dir = Path(set_dir)
    ids = {p.name for p in (set_dir / "tasks").iterdir() if p.is_dir()}
    listed = set(set_meta(set_dir)["tasks"])
    if ids != listed:
        raise ValueError(f"meta.json tasks differ from tasks/: missing {sorted(ids - listed)}, "
                         f"extra {sorted(listed - ids)}")
    seen: dict[str, str] = {}
    for split in SPLITS:
        f = set_dir / "splits" / f"{split}.txt"
        for tid in (f.read_text().split() if f.is_file() else []):
            if tid in seen:
                raise ValueError(f"{tid} is in both {seen[tid]} and {split}")
            seen[tid] = split
    if ids - seen.keys():
        raise ValueError(f"tasks in no split: {sorted(ids - seen.keys())}")
    if seen.keys() - ids:
        raise ValueError(f"split ids without a task dir: {sorted(seen.keys() - ids)}")


def load_split(set_dir: str | Path, split: str) -> list[dict]:
    """Read one split's task dicts: only the model-visible files plus meta. Nothing under tests/."""
    set_dir = Path(set_dir)
    check_splits(set_dir)
    tasks = []
    for tid in (set_dir / "splits" / f"{split}.txt").read_text().split():
        tdir = set_dir / "tasks" / tid
        tasks.append({
            "id":       tid,
            "task_dir": str(tdir.resolve()),
            "meta":     task_meta(tdir),
            "request":  (tdir / "request.md").read_text(),
            "starter":  (tdir / "starter.jac").read_text(),
        })
    return tasks


def to_dataset(tasks: list[dict], prompts: dict, seed: int = SEED) -> Dataset:
    """One row per task: prompt messages + columns the reward functions receive as kwargs."""
    rng = random.Random(seed)
    return Dataset.from_list([{
        "prompt":    render_prompt(t, prompts, rng),
        "task_id":   t["id"],
        "task_dir":  t["task_dir"],
        "task_type": t["meta"]["task_type"],
    } for t in tasks])
