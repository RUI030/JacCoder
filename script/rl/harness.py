"""Render a task into chat messages; turn a completion into the workspace files a grader runs."""

import random, re

from utils.jac_block import extract_jac_blocks

# Setting =================================================
THINK_END  = "</think>"
TEST_BLOCK = re.compile(r'(?m)^\s*test\s*["\'{]')     # also catches the anonymous `test {` form
PY_BLOCK   = "::py::"


# Functions ===============================================
def render_prompt(task: dict, prompts: dict, rng: random.Random) -> list[dict]:
    """System prompt from the shared SFT pool, then instruction + request.md + starter in a jac fence."""
    user = (f"{rng.choice(prompts['rl_functions'])}\n\n{task['request'].strip()}\n\n"
            f"Starter (`{task['meta']['target']}`):\n```jac\n{task['starter'].strip()}\n```")
    return [
        {"role": "system", "content": rng.choice(prompts["system"])},
        {"role": "user",   "content": user},
    ]


def completion_text(completion) -> str:
    """TRL passes conversational completions as [{"role": "assistant", "content": ...}]."""
    if isinstance(completion, list):
        return "".join(m.get("content") or "" for m in completion)
    return completion


def forbidden_hit(source: str, forbidden: list[str]) -> str | None:
    """First forbidden module (plain or `from` import, any dotted submodule) or `::py::` escape in source."""
    for name in forbidden:
        if name == PY_BLOCK:
            if PY_BLOCK in source:
                return name
        elif re.search(rf"(?m)^\s*import\s+(from\s+)?{re.escape(name)}\b", source):
            return name
    return None


def materialize(completion, task_meta: dict) -> tuple[dict[str, str] | None, str]:
    """Return ({target: source}, "") or (None, reason) when the format rules reject it.

    Prose (and a reasoning block) around the answer is allowed; exactly one ```jac block
    after any `</think>` is required. A `test` block is rejected because `jac test`
    also collects tests from the imported module, and forbidden imports are rejected
    before any code runs.
    """
    text = completion_text(completion).split(THINK_END)[-1]
    blocks = extract_jac_blocks(text)
    if len(blocks) != 1:
        return None, f"{len(blocks)} jac blocks"
    source = blocks[0]
    if TEST_BLOCK.search(source):
        return None, "test block"
    hit = forbidden_hit(source, task_meta.get("forbidden", []))
    if hit:
        return None, f"forbidden: {hit}"
    return {task_meta["target"]: source + "\n"}, ""
