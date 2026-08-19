"""CPT dataset builders: code2cpt, md2cpt, html2cpt, repo2cpt.

Every builder is a thin wire-up over the shared helpers in `io`, `chunking`,
and `classifier`. Nothing here reimplements walking, splitting, chunking, or
classification.
"""
from __future__ import annotations

import fnmatch
import os
from html.parser import HTMLParser
from pathlib import Path
from typing import Iterable

from . import chunking, classifier, io


_SOURCE_BY_BUILDER = {
    "code": "code",
    "md": "md",
    "html": "html",
    "repo": "repo",
}


def _row(text: str, source: str, do_classify: bool) -> dict:
    meta: dict = {"source": source}
    if do_classify:
        meta["class"] = classifier.classify(text)
    return {"text": text, "meta": meta}


def _default_out_dir(input_dir: str | os.PathLike, subdir: str = "CPT") -> str:
    name = Path(input_dir).name
    return str(Path(__file__).resolve().parent.parent / subdir / name)


# ---------------------------------------------------------------------------
# code2cpt
# ---------------------------------------------------------------------------


def code2cpt(
    input_dir: str | os.PathLike,
    *,
    out_dir: str | None = None,
    mark_file_name: bool = False,
    split: list[float] | None = None,
    split_name: list[str] | None = None,
    shuffle: bool = False,
    seed: int = 0,
    extension_filter: list[str] | None = None,
    classify: bool = True,
) -> dict[str, int]:
    split = split or [0.8, 0.2]
    split_name = split_name or ["train", "valid"]
    extension_filter = extension_filter or ["jac"]
    out_dir = out_dir or _default_out_dir(input_dir)
    input_dir = Path(input_dir)

    rows: list[dict] = []
    for path in io.walk_files(input_dir, extension_filter):
        text = path.read_text(encoding="utf-8", errors="replace")
        if mark_file_name:
            rel = path.relative_to(input_dir)
            text = f"# file: {rel}\n{text}"
        rows.append(_row(text, "code", classify))
    return io.write_shards(rows, out_dir, split, split_name, shuffle, seed)


# ---------------------------------------------------------------------------
# md2cpt / html2cpt share this skeleton
# ---------------------------------------------------------------------------


def _chunk_files(
    input_dir: Path,
    extension_filter: list[str],
    *,
    source: str,
    boundary: str,
    max_tokens: int,
    tokenizer: str,
    header_comment: bool,
    classify: bool,
    preprocess=lambda t: t,
) -> Iterable[dict]:
    for path in io.walk_files(input_dir, extension_filter):
        text = preprocess(path.read_text(encoding="utf-8", errors="replace"))
        rel = str(path.relative_to(input_dir))
        chunks = chunking.chunk(
            text,
            max_tokens=max_tokens,
            boundary=boundary,
            header_comment=header_comment,
            tokenizer=tokenizer,
            filename=rel,
        )
        for c in chunks:
            yield _row(c, source, classify)


def md2cpt(
    input_dir: str | os.PathLike,
    *,
    out_dir: str | None = None,
    split: list[float] | None = None,
    split_name: list[str] | None = None,
    shuffle: bool = False,
    seed: int = 0,
    extension_filter: list[str] | None = None,
    max_tokens: int = 4096,
    tokenizer: str = "gpt2",
    header_comment: bool = True,
    classify: bool = True,
) -> dict[str, int]:
    split = split or [0.8, 0.2]
    split_name = split_name or ["train", "valid"]
    extension_filter = extension_filter or ["md"]
    out_dir = out_dir or _default_out_dir(input_dir)

    rows = list(
        _chunk_files(
            Path(input_dir),
            extension_filter,
            source="md",
            boundary="markdown",
            max_tokens=max_tokens,
            tokenizer=tokenizer,
            header_comment=header_comment,
            classify=classify,
        )
    )
    return io.write_shards(rows, out_dir, split, split_name, shuffle, seed)


# ---------------------------------------------------------------------------
# html2cpt: tag cleaning pre-pass, then md-style chunking
# ---------------------------------------------------------------------------


class _HTMLToText(HTMLParser):
    """Strip listed tags entirely, unwrap the rest, keep headings as `# ...`."""

    _HEADING_LEVELS = {"h1": 1, "h2": 2, "h3": 3, "h4": 4, "h5": 5, "h6": 6}

    def __init__(self, strip_tags: set[str]):
        super().__init__(convert_charrefs=True)
        self.strip_tags = strip_tags
        self.parts: list[str] = []
        self._skip_depth = 0
        self._heading: int | None = None

    def handle_starttag(self, tag, attrs):
        if tag in self.strip_tags:
            self._skip_depth += 1
            return
        if tag in self._HEADING_LEVELS:
            self._heading = self._HEADING_LEVELS[tag]
            self.parts.append("\n" + "#" * self._heading + " ")
        elif tag in {"p", "br", "div", "li", "tr"}:
            self.parts.append("\n")

    def handle_endtag(self, tag):
        if tag in self.strip_tags and self._skip_depth:
            self._skip_depth -= 1
            return
        if tag in self._HEADING_LEVELS:
            self.parts.append("\n")
            self._heading = None
        elif tag in {"p", "div", "li", "tr"}:
            self.parts.append("\n")

    def handle_data(self, data):
        if self._skip_depth:
            return
        self.parts.append(data)

    def text(self) -> str:
        return "".join(self.parts)


def _strip_html(text: str, strip_tags: list[str], strip_selectors: list[str]) -> str:
    # `strip_selectors` is accepted for API symmetry but requires a CSS engine
    # (e.g. BeautifulSoup). Not implemented in this minimal path — pass tag
    # names via `strip_tags` for now.
    if strip_selectors:
        raise NotImplementedError(
            "strip_selectors requires an optional CSS backend; use strip_tags"
        )
    parser = _HTMLToText(strip_tags=set(strip_tags))
    parser.feed(text)
    return parser.text()


def html2cpt(
    input_dir: str | os.PathLike,
    *,
    out_dir: str | None = None,
    split: list[float] | None = None,
    split_name: list[str] | None = None,
    shuffle: bool = False,
    seed: int = 0,
    extension_filter: list[str] | None = None,
    max_tokens: int = 4096,
    tokenizer: str = "gpt2",
    header_comment: bool = True,
    strip_tags: list[str] | None = None,
    strip_selectors: list[str] | None = None,
    classify: bool = True,
) -> dict[str, int]:
    split = split or [0.8, 0.2]
    split_name = split_name or ["train", "valid"]
    extension_filter = extension_filter or ["html", "htm"]
    strip_tags = strip_tags or ["script", "style", "nav", "footer"]
    strip_selectors = strip_selectors or []
    out_dir = out_dir or _default_out_dir(input_dir)

    def pre(t: str) -> str:
        return _strip_html(t, strip_tags, strip_selectors)

    rows = list(
        _chunk_files(
            Path(input_dir),
            extension_filter,
            source="html",
            boundary="markdown",
            max_tokens=max_tokens,
            tokenizer=tokenizer,
            header_comment=header_comment,
            classify=classify,
            preprocess=pre,
        )
    )
    return io.write_shards(rows, out_dir, split, split_name, shuffle, seed)


# ---------------------------------------------------------------------------
# repo2cpt: repo-level packing, split at repo level
# ---------------------------------------------------------------------------


def _discover_repos(root: Path) -> list[Path]:
    """Repos are subdirectories that either contain `.git` or are top-level dirs."""
    if (root / ".git").exists():
        return [root]
    repos = [p for p in sorted(root.iterdir()) if p.is_dir()]
    return repos or [root]


def _order_files(paths: list[Path], repo_root: Path, file_order: list[str]) -> list[Path]:
    """Sort files by priority glob order; unmatched appended alphabetically."""
    remaining = list(paths)
    ordered: list[Path] = []
    for pattern in file_order:
        matched = [p for p in remaining if fnmatch.fnmatch(str(p.relative_to(repo_root)), pattern)]
        ordered.extend(sorted(matched))
        remaining = [p for p in remaining if p not in matched]
    ordered.extend(sorted(remaining))
    return ordered


def repo2cpt(
    input_dir: str | os.PathLike,
    *,
    out_dir: str | None = None,
    split: list[float] | None = None,
    split_name: list[str] | None = None,
    shuffle: bool = False,
    seed: int = 0,
    extension_filter: list[str] | None = None,
    file_order: list[str] | None = None,
    max_tokens: int = 8192,
    tokenizer: str = "gpt2",
    separator: str = "# ==== file: {path} ==== #",
    header_comment: bool = True,
    classify: bool = True,
) -> dict[str, int]:
    split = split or [0.8, 0.2]
    split_name = split_name or ["train", "valid"]
    extension_filter = extension_filter or ["jac", "md", "toml"]
    file_order = file_order or ["README*", "*.toml", "*.jac", "tests/*"]
    out_dir = out_dir or _default_out_dir(input_dir)
    input_dir = Path(input_dir)

    repos = _discover_repos(input_dir)

    # Build per-repo row lists, then split at repo level.
    per_repo_rows: list[list[dict]] = []
    for repo in repos:
        files = list(io.walk_files(repo, extension_filter))
        if not files:
            continue
        ordered = _order_files(files, repo, file_order)
        parts: list[str] = []
        for f in ordered:
            rel = f.relative_to(repo)
            parts.append(separator.format(path=rel))
            parts.append(f.read_text(encoding="utf-8", errors="replace"))
        packed = "\n".join(parts)

        chunks = chunking.chunk(
            packed,
            max_tokens=max_tokens,
            boundary="code",
            header_comment=header_comment,
            tokenizer=tokenizer,
            filename=repo.name,
        )
        per_repo_rows.append([_row(c, "repo", classify) for c in chunks])

    # Split repos → flatten rows for each split → hand off to write_shards
    # with split=[1.0] so it just writes one file per pre-split bucket.
    import random as _random

    idxs = list(range(len(per_repo_rows)))
    if shuffle:
        _random.Random(seed).shuffle(idxs)

    # Resolve split→(name, fraction) using the same rule io uses.
    resolved = io._resolve_splits(split, split_name)
    n = len(idxs)
    counts: dict[str, int] = {}
    cursor = 0
    Path(out_dir).mkdir(parents=True, exist_ok=True)
    import json as _json

    for i, (name, frac) in enumerate(resolved):
        take = n - cursor if i == len(resolved) - 1 else int(round(n * frac))
        bucket_idxs = idxs[cursor : cursor + take]
        cursor += take
        rows = [r for j in bucket_idxs for r in per_repo_rows[j]]
        with (Path(out_dir) / f"{name}.jsonl").open("w", encoding="utf-8") as f:
            for r in rows:
                f.write(_json.dumps(r, ensure_ascii=False) + "\n")
        counts[name] = len(rows)
    return counts
