"""Single-label content classifier.

Classes are ordered by complexity. The highest-complexity class whose signal
matches wins, and it subsumes the lower ones (an `osp` row is understood to
also contain `graph`, so we tag only `osp`).
"""
from __future__ import annotations

import re

# (class, list of regex signals). Order matters — checked top to bottom.
_RULES: list[tuple[str, list[re.Pattern[str]]]] = [
    (
        "fullstack",
        [re.compile(p) for p in (r"\bJSX\b", r"\bclient_kind\b", r"@jac/", r"\buseState\b")],
    ),
    (
        "osp",
        [re.compile(p) for p in (r"\bwalker\b", r"\bspawn\b", r"\bvisit\s")],
    ),
    (
        "graph",
        [re.compile(p) for p in (r"\bnode\b", r"\bedge\b", r"\+\+>", r"-->", r"<\+\+", r"<--")],
    ),
]

_FALLBACK = "function"


def classify(text: str) -> str:
    for cls, patterns in _RULES:
        if any(p.search(text) for p in patterns):
            return cls
    return _FALLBACK
