"""Recursive chunker used by every non-code CPT builder."""
from __future__ import annotations

import re
from functools import lru_cache
from typing import Callable


@lru_cache(maxsize=4)
def _get_encoder(name: str):
    try:
        import tiktoken
    except ImportError as e:
        raise ImportError(
            "tiktoken is required for token counting; `pip install tiktoken`"
        ) from e
    try:
        return tiktoken.get_encoding(name)
    except Exception:
        return tiktoken.encoding_for_model(name)


def count_tokens(text: str, tokenizer: str = "gpt2") -> int:
    return len(_get_encoder(tokenizer).encode(text))


# ---------------------------------------------------------------------------
# Boundary splitters — each returns a list of (title, body) segments.
# `title` is used to build the breadcrumb; an empty title means "no header".
# ---------------------------------------------------------------------------

_MD_HEADING = re.compile(r"^(#{1,6})\s+(.*)$", re.MULTILINE)


def _split_markdown(text: str) -> list[tuple[int, str, str]]:
    """Return [(level, title, body)] segments split at markdown headings.

    A segment's body includes everything up to the next same-or-higher heading.
    If there is no heading, one segment (0, "", text) is returned.
    """
    matches = list(_MD_HEADING.finditer(text))
    if not matches:
        return [(0, "", text)]
    segments: list[tuple[int, str, str]] = []
    # Preamble before the first heading.
    if matches[0].start() > 0:
        segments.append((0, "", text[: matches[0].start()]))
    for i, m in enumerate(matches):
        level = len(m.group(1))
        title = m.group(2).strip()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        body = text[m.end() : end]
        segments.append((level, title, body))
    return segments


_CODE_TOPLEVEL = re.compile(
    r"^(?:def|class|node|edge|walker|obj|enum|impl|can)\b.*$",
    re.MULTILINE,
)


def _split_code(text: str) -> list[tuple[int, str, str]]:
    matches = list(_CODE_TOPLEVEL.finditer(text))
    if not matches:
        return [(0, "", text)]
    segments: list[tuple[int, str, str]] = []
    if matches[0].start() > 0:
        segments.append((0, "", text[: matches[0].start()]))
    for i, m in enumerate(matches):
        title = m.group(0).strip()[:80]
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        body = m.group(0) + text[m.end() : end]
        segments.append((1, title, body))
    return segments


def _split_lines(text: str, max_tokens: int, tokenizer: str) -> list[str]:
    """Last-resort line-level split targeting `max_tokens`."""
    lines = text.splitlines(keepends=True)
    out: list[str] = []
    buf: list[str] = []
    buf_tokens = 0
    for line in lines:
        t = count_tokens(line, tokenizer)
        if buf and buf_tokens + t > max_tokens:
            out.append("".join(buf))
            buf, buf_tokens = [], 0
        buf.append(line)
        buf_tokens += t
    if buf:
        out.append("".join(buf))
    return out


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------


def _comment(text: str, style: str) -> str:
    return f"# {text}" if style == "hash" else f"<!-- {text} -->"


def chunk(
    text: str,
    *,
    max_tokens: int = 4096,
    boundary: str = "markdown",
    header_comment: bool = True,
    overlap_tokens: int = 0,
    tokenizer: str = "gpt2",
    filename: str = "",
) -> list[str]:
    """Split `text` into chunks of at most `max_tokens` tokens.

    Returns a list of strings. Each chunk is optionally prefixed with a
    breadcrumb comment: `<FILENAME>/<HEADING 1>/.../<CHUNK N>`.
    """
    comment_style = "hash" if boundary == "code" else "xml"
    splitters: dict[str, Callable[[str], list[tuple[int, str, str]]]] = {
        "markdown": _split_markdown,
        "code": _split_code,
    }

    if count_tokens(text, tokenizer) <= max_tokens and boundary != "line":
        crumbs = [filename] if filename else []
        prefix = (
            _comment("/".join(crumbs + ["0"]), comment_style) + "\n"
            if header_comment and crumbs
            else ""
        )
        return [prefix + text] if prefix else [text]

    # Segment by structure, then fall back to line split if a segment is still too big.
    if boundary in splitters:
        segments = splitters[boundary](text)
    else:
        segments = [(0, "", text)]

    chunks: list[tuple[list[str], str]] = []  # (breadcrumb path, body)
    heading_stack: list[str] = []
    for level, title, body in segments:
        if title:
            heading_stack = heading_stack[: max(level - 1, 0)] + [title]
        crumbs = ([filename] if filename else []) + heading_stack

        if count_tokens(body, tokenizer) <= max_tokens:
            chunks.append((crumbs.copy(), body))
        else:
            for piece in _split_lines(body, max_tokens, tokenizer):
                chunks.append((crumbs.copy(), piece))

    # Number chunks and attach breadcrumbs.
    out: list[str] = []
    for i, (crumbs, body) in enumerate(chunks):
        if header_comment and crumbs:
            crumb_str = "/".join(crumbs + [str(i)])
            body = _comment(crumb_str, comment_style) + "\n" + body
        if overlap_tokens > 0 and out:
            prev_tail = _tail(out[-1], overlap_tokens, tokenizer)
            body = prev_tail + body
        out.append(body)
    return out


def _tail(text: str, n_tokens: int, tokenizer: str) -> str:
    enc = _get_encoder(tokenizer)
    ids = enc.encode(text)
    if len(ids) <= n_tokens:
        return text
    return enc.decode(ids[-n_tokens:])
