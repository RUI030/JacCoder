"""Extract fenced ```jac code blocks from model output."""

import re

_JAC_FENCE = re.compile(r"```jac\s*\n(.*?)```", re.DOTALL)


def extract_jac_blocks(text: str) -> list[str]:
    """Return every ```jac ... ``` block body, in order. Empty list if none."""
    return [m.group(1).strip() for m in _JAC_FENCE.finditer(text)]


def first_jac_block(text: str) -> str | None:
    """Return the first ```jac ... ``` block body, or None if absent."""
    blocks = extract_jac_blocks(text)
    return blocks[0] if blocks else None
