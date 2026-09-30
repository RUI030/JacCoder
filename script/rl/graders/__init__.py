"""Grader registry plus the grading path shared by training rewards and eval."""

from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

from rl.graders import functions
from rl.harness import materialize
from rl.task import task_meta

# Setting =================================================
GRADERS = {"functions": functions.grade}


# Functions ===============================================
def tests_dir_of(task_dir: str | Path) -> Path:
    """tasks/<id> → tests/<id>, the grader-only sibling."""
    task_dir = Path(task_dir)
    return task_dir.parent.parent / "tests" / task_dir.name


def grade_completion(completion, task_dir: str | Path, timeout: float, mem_gb: float) -> dict:
    """Materialize one completion and grade it with its task type's grader."""
    meta = task_meta(task_dir)
    files, reason = materialize(completion, meta)
    if files is None:
        return {"status": "format_fail", "check_pass": False, "passed": 0, "total": 0,
                "reward": 0.0, "detail": reason, "ms": 0}
    return GRADERS[meta["task_type"]](files, tests_dir_of(task_dir), meta, timeout,
                                      int(mem_gb * (1 << 30)))


def grade_many(items: list[tuple], workers: int, timeout: float, mem_gb: float) -> list[dict]:
    """Grade [(completion, task_dir), ...] on a thread pool (grading is subprocess-bound)."""
    with ThreadPoolExecutor(workers) as pool:
        return list(pool.map(lambda it: grade_completion(it[0], it[1], timeout, mem_gb), items))
