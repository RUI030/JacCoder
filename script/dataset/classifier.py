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

Classifier options
------------------

| Option         | Function              | How it decides                                                                    |
| -------------- | --------------------- | --------------------------------------------------------------------------------- |
| **Simple**     | `classify`            | Baseline keyword regex on the raw text. Fast, noisy — matches keywords in         |
|                |                       | docstrings, comments, and variable names.                                         |
| **Structural** | `classify_structural` | Strip strings + comments, then match archetype declarations at line start         |
|                |                       | (`^node Name {`, `^walker Name {`, JSX component tags, `from '...'` imports).     |
|                |                       | Canonical build-time classifier used by `ds4cpt.py`.                              |

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


def classify(text: str) -> str:
    for cls, patterns in RULES:
        if any(p.search(text) for p in patterns):
            return cls
    return FALLBACK


# Structural Classifier ===================================
# Strip strings + comments (so docstring keywords don't match), then look for
# archetype declarations anchored at line start (so variable names don't match).
# JSX components must start with an uppercase letter — that keeps `list<T>` and
# `x < y` from misfiring as fullstack.

_STRING_OR_COMMENT = re.compile(
    r'"""[\s\S]*?"""'      # triple-double
    r"|'''[\s\S]*?'''"     # triple-single
    r'|"(?:\\.|[^"\\])*"'  # double-quoted
    r"|'(?:\\.|[^'\\])*'"  # single-quoted
    r"|#[^\n]*"            # python-style comment
    r"|//[^\n]*"           # c-style line comment
    r"|/\*[\s\S]*?\*/"     # c-style block comment
)

DECL_RULES: list[tuple[str, list[re.Pattern[str]]]] = [
    (
        "fullstack",
        [re.compile(r"<[A-Z]\w*(?:\s|/?>)"),                       # JSX component
         re.compile(r"^\s*import\s+.+\s+from\s+['\"]", re.M)],     # npm import
    ),
    (
        "osp",
        [re.compile(r"^\s*walker\s+\w+\s*[{(:]", re.M),
         re.compile(r"\bspawn\b\s*[\w(]")],
    ),
    (
        "graph",
        [re.compile(r"^\s*(?:node|edge)\s+\w+\s*[{(:]", re.M)],
    ),
]


def strip_noise(text: str) -> str:
    return _STRING_OR_COMMENT.sub(" ", text)


def classify_structural(text: str) -> str:
    """Canonical build-time classifier: strip noise, then match archetype decls."""
    code = strip_noise(text)
    for cls, patterns in DECL_RULES:
        if any(p.search(code) for p in patterns):
            return cls
    return FALLBACK
