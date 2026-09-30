"""TRL reward functions for RL tasks: grade each completion once per step, log rollouts."""

import hashlib, json, time
from collections import Counter
from pathlib import Path

from utils import jac_cli
from rl.graders import grade_many
from rl.harness import completion_text

# Setting =================================================
INFRA = "infra_error"


# Functions ===============================================
def host_ram_gb() -> float:
    """Used host RAM (MemTotal - MemAvailable) in GB."""
    info = dict(line.split(":", 1) for line in Path("/proc/meminfo").read_text().splitlines())
    kb = lambda k: int(info[k].split()[0])
    return (kb("MemTotal") - kb("MemAvailable")) / (1 << 20)


def neutral_infra(rewards: list[float | None], group: int) -> list[float]:
    """Replace grading crashes (None) with the mean of the valid rewards in their group.

    TRL 0.24 turns a None reward into NaN and then `nansum`s across reward
    functions, so with any weight-0 metric function the row still ends up as 0,
    i.e. a model failure. The group mean gives it advantage 0 instead. A group that
    is all infra errors becomes all 0 (zero std, no signal).
    """
    out = []
    for g in range(0, len(rewards), group):
        chunk = rewards[g:g + group]
        valid = [r for r in chunk if r is not None]
        fill  = sum(valid) / len(valid) if valid else 0.0
        out += [fill if r is None else r for r in chunk]
    return out


class Grader:
    """Grades a generation batch once and serves every reward function from the cache.

    TRL calls each reward function separately on the same batch; only the first
    call per step runs `jac`. The first call also writes rollouts/step_<N>.jsonl,
    appends one line to rollouts/stats.jsonl, and purges jac's postgres data
    every `purge_pg_steps` steps (`jac test` leaves ~45MB of databases per sample).
    """

    def __init__(self, cfg: dict):
        self.cfg     = cfg
        self.out     = Path(cfg["out_dir"]) / "rollouts"
        self.cache: dict[tuple, dict] = {}
        self.step    = None
        self.purged  = 0
        self.out.mkdir(parents=True, exist_ok=True)
        jac_cli.purge_pg()
        jac_cli.start_pg()                       # postgres outside any per-test cgroup scope

    def rows(self, completions, task_id, task_dir, step: int) -> list[dict]:
        texts = [completion_text(c) for c in completions]
        keys  = [(t, hashlib.sha1(x.encode()).hexdigest()) for t, x in zip(task_id, texts)]
        if step != self.step:
            self.step, self.cache = step, {}
        todo = {k: (x, d) for k, x, d in zip(keys, texts, task_dir) if k not in self.cache}
        if todo:
            self.grade(todo, step)
        return [self.cache[k] for k in keys]

    def grade(self, todo: dict, step: int) -> None:
        cfg = self.cfg
        if cfg["purge_pg_steps"] and step - self.purged >= cfg["purge_pg_steps"]:
            jac_cli.purge_pg()
            jac_cli.start_pg()
            self.purged = step
        pg_mb = jac_cli.pg_size_bytes() / 1e6
        start = time.perf_counter()
        graded = grade_many(list(todo.values()), cfg["grade_workers"], cfg["grade_timeout"], cfg["grade_mem_gb"])
        grade_s = time.perf_counter() - start
        with (self.out / f"step_{step}.jsonl").open("a", encoding="utf-8") as f:
            for (key, (text, _)), row in zip(todo.items(), graded):
                self.cache[key] = row
                f.write(json.dumps({"step": step, "task_id": key[0], "completion": text, **row}) + "\n")
        status = Counter(r["status"] for r in graded)
        stats = {"step": step, "n": len(graded), "grade_s": round(grade_s, 1),
                 "infra_rate": status[INFRA] / len(graded), "status": dict(status),
                 "host_ram_gb": round(host_ram_gb(), 1), "pg_mb": round(pg_mb)}
        with (self.out / "stats.jsonl").open("a", encoding="utf-8") as f:
            f.write(json.dumps(stats) + "\n")


def make_reward_funcs(cfg: dict) -> tuple[list, list[float]]:
    """(reward_funcs, reward_weights) for GRPOTrainer.

    `functions_reward` (weight 1) is RL.md's `0 | passed/total`. The rest have
    weight 0: TRL logs their mean per step, which gives compile / format / pass /
    infra-error rates for free. `reward: constant` is the plumbing smoke test.
    """
    if cfg["reward"] == "constant":
        def constant_reward(completions, **kwargs) -> list[float]:
            return [1.0] * len(completions)
        return [constant_reward], [1.0]

    grader = Grader(cfg)

    def graded(completions, task_id, task_dir, trainer_state, **kwargs) -> list[dict]:
        return grader.rows(completions, task_id, task_dir, trainer_state.global_step)

    def functions_reward(completions, task_id, task_dir, trainer_state, **kwargs) -> list[float]:
        rows = graded(completions, task_id, task_dir, trainer_state)
        return neutral_infra([r["reward"] for r in rows], cfg["num_generations"])

    def compile_rate(completions, task_id, task_dir, trainer_state, **kwargs) -> list[float]:
        return [float(r["check_pass"]) for r in graded(completions, task_id, task_dir, trainer_state)]

    def format_rate(completions, task_id, task_dir, trainer_state, **kwargs) -> list[float]:
        return [float(r["status"] != "format_fail") for r in graded(completions, task_id, task_dir, trainer_state)]

    def pass_rate(completions, task_id, task_dir, trainer_state, **kwargs) -> list[float]:
        return [float(r["status"] == "pass") for r in graded(completions, task_id, task_dir, trainer_state)]

    def infra_rate(completions, task_id, task_dir, trainer_state, **kwargs) -> list[float]:
        return [float(r["status"] == INFRA) for r in graded(completions, task_id, task_dir, trainer_state)]

    return [functions_reward, compile_rate, format_rate, pass_rate, infra_rate], [1.0, 0.0, 0.0, 0.0, 0.0]
