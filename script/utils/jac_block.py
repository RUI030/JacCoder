"""Extract fenced ```jac code blocks + classify model output shape."""

import re
from typing import Literal

_JAC_FENCE = re.compile(r"```jac\s*\n(.*?)```", re.DOTALL)
_ANY_FENCE = re.compile(r"```([A-Za-z0-9_+.-]*)\s*\n.*?```", re.DOTALL)

OutputKind = Literal["has_block", "wrong_fence", "no_output"]


def extract_jac_blocks(text: str) -> list[str]:
    """Return every ```jac ... ``` block body, in order. Empty list if none."""
    return [m.group(1).strip() for m in _JAC_FENCE.finditer(text)]


def first_jac_block(text: str) -> str | None:
    """Return the first ```jac ... ``` block body, or None if absent."""
    blocks = extract_jac_blocks(text)
    return blocks[0] if blocks else None


def classify_output(text: str) -> OutputKind:
    """Coarse shape of the LLM output. Independent of code validity.

    - has_block    : ≥1 well-formed ```jac ... ``` fence
    - wrong_fence  : ≥1 fenced block but none labelled jac (```python, bare ```, etc.)
    - no_output    : no fenced block at all (pure prose, or malformed fence)
    """
    if _JAC_FENCE.search(text):
        return "has_block"
    if _ANY_FENCE.search(text):
        return "wrong_fence"
    return "no_output"
