"""Single-label content classifier.

Classes are ordered by complexity. The highest-complexity class whose signal
matches wins, and it subsumes the lower ones (an `osp` row is understood to
also contain `graph`, so we tag only `osp`).

| Class         | Keywords                |
| ------------- | ----------------------- |
| **fullstack** | JSX, cl                 |
| **osp**       | walker, spawn           |
| **graph**     | node, edge              |
| **function**  | Others just basic jac   |

"""

from __future__ import annotations

import re

# Simple Classifier =======================================

RULES: list[tuple[str, list[re.Pattern[str]]]] = [
    (
        "fullstack",
        [re.compile(p) for p in (r"\bJSX\b", r"\bcl\b")],
    ),
    (
        "osp",
        [re.compile(p) for p in (r"\bwalker\b", r"\bspawn\b")],
    ),
    (
        "graph",
        [re.compile(p) for p in (r"\bnode\b", r"\bedge\b")],
    ),
]
FALLBACK = "function"

# Classifier ==============================================

def classify(text: str) -> str:
    for cls, patterns in RULES:
        if any(p.search(text) for p in patterns):
            return cls
    return FALLBACK
