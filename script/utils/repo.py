"""Repo-level helpers: file walking and Jac scaffold extraction."""

from __future__ import annotations

import re
from pathlib import Path
from typing import Iterator

# Files/dirs to keep or drop when walking a repo =============
DROP_DIRS: frozenset[str] = frozenset({
    ".jac", ".git", "node_modules", "__pycache__",
    "dist", "build", ".next", ".venv", "venv",
    ".pytest_cache", ".mypy_cache", ".ruff_cache", ".turbo",
})
KEEP_EXTS: frozenset[str] = frozenset({
    ".jac", ".md", ".toml", ".json", ".py",
    ".ts", ".tsx", ".js", ".jsx", ".css", ".html", ".txt", ".yaml", ".yml",
})
DROP_EXTS: frozenset[str] = frozenset({
    ".lock", ".pyc", ".pyo", ".so", ".env",
})
KEEP_NAMES: frozenset[str] = frozenset({
    "README", "LICENSE", "Makefile",
})


def keep_path(path: Path, repo_root: Path) -> bool:
    """True iff `path` is dev-authored source we want in training."""
    try:
        rel = path.relative_to(repo_root)
    except ValueError:
        return False
    if any(part in DROP_DIRS for part in rel.parts):
        return False
    if path.suffix in DROP_EXTS:
        return False
    if path.suffix in KEEP_EXTS:
        return True
    return path.stem in KEEP_NAMES and path.suffix == ""


def iter_repo_files(repo_root: Path) -> Iterator[Path]:
    """Yield every source file under `repo_root` that survives keep_path()."""
    for path in sorted(repo_root.rglob("*")):
        if path.is_file() and keep_path(path, repo_root):
            yield path


# Jac scaffold extraction ====================================
# Strip the body of every `def`, `can`, `with entry`, and `impl` block. Leaves
# node/edge/obj/walker headers, `has` fields, docstrings, imports intact.

_STRIP_HEADS = re.compile(
    r"^(?P<lead>\s*)"
    r"(?P<head>(?:def(?::\w+)?|can|with\s+entry|impl)\b[^{;]*)"
    r"(?P<open>\{)",
    re.MULTILINE,
)


def _skip_over(text: str, i: int) -> int:
    """Skip past a string literal or comment starting at i. Return new index."""
    n = len(text)
    ch = text[i]
    if ch in ('"', "'"):
        # triple?
        if text[i:i+3] in ('"""', "'''"):
            quote = text[i:i+3]
            j = text.find(quote, i + 3)
            return n if j < 0 else j + 3
        # single-line quoted; honour backslash escapes
        j = i + 1
        while j < n:
            if text[j] == "\\":
                j += 2; continue
            if text[j] == ch:
                return j + 1
            j += 1
        return n
    if ch == "#" or text[i:i+2] == "//":
        j = text.find("\n", i)
        return n if j < 0 else j
    if text[i:i+2] == "/*":
        j = text.find("*/", i + 2)
        return n if j < 0 else j + 2
    return i + 1


def _find_matching_close(text: str, open_idx: int) -> int:
    """Given index of `{`, return index just past matching `}`. -1 if unbalanced."""
    n = len(text)
    depth = 0
    i = open_idx
    while i < n:
        ch = text[i]
        if ch in ('"', "'", "#") or text[i:i+2] in ("//", "/*"):
            i = _skip_over(text, i)
            continue
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return i + 1
        i += 1
    return -1


def strip_bodies(source: str) -> str:
    """Return `source` with every def/can/with-entry/impl body replaced by `{ ... }`."""
    out: list[str] = []
    cursor = 0
    for m in _STRIP_HEADS.finditer(source):
        head_start, open_at = m.start(), m.end("open") - 1
        if open_at < cursor:
            continue
        close = _find_matching_close(source, open_at)
        if close < 0:
            continue
        out.append(source[cursor:open_at])
        out.append("{ ... }")
        cursor = close
    out.append(source[cursor:])
    return "".join(out)
