"""Shared IO: file walking and shard writing.

Every builder in `build_cpt_dataset.py` calls into these two functions so the
walk/shuffle/split/name/write logic exists in exactly one place.
"""
from __future__ import annotations

import json
import os
import random
from pathlib import Path
from typing import Iterable, Iterator


def walk_files(
    root: str | os.PathLike,
    extension_filter: list[str],
) -> Iterator[Path]:
    """Yield files under `root` whose extension (no dot) is in `extension_filter`.

    Order is deterministic (sorted) so downstream shuffles with a fixed seed
    are reproducible.
    """
    root = Path(root)
    allowed = {e.lower().lstrip(".") for e in extension_filter}
    for path in sorted(root.rglob("*")):
        if path.is_file() and path.suffix.lstrip(".").lower() in allowed:
            yield path


def _resolve_splits(
    split: list[float],
    split_name: list[str],
) -> list[tuple[str, float]]:
    total = sum(split)
    if total > 1.0 + 1e-9:
        raise ValueError(f"split sums to {total} > 1.0")
    parts = list(split)
    if total < 1.0 - 1e-9:
        parts.append(1.0 - total)

    names = list(split_name)
    for i in range(len(names), len(parts)):
        names.append(f"split_{i:03d}")
    return list(zip(names[: len(parts)], parts))


def write_shards(
    rows: Iterable[dict],
    out_dir: str | os.PathLike,
    split: list[float],
    split_name: list[str],
    shuffle: bool = False,
    seed: int = 0,
) -> dict[str, int]:
    """Write `rows` into `out_dir/<name>.jsonl`, one file per split.

    Returns a dict {split_name: row_count}. The remainder rule and auto-fill
    naming live here so no builder reimplements them.
    """
    rows = list(rows)
    if shuffle:
        random.Random(seed).shuffle(rows)

    splits = _resolve_splits(split, split_name)
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    n = len(rows)
    counts: dict[str, int] = {}
    cursor = 0
    for i, (name, frac) in enumerate(splits):
        take = n - cursor if i == len(splits) - 1 else int(round(n * frac))
        chunk = rows[cursor : cursor + take]
        cursor += take
        path = out_dir / f"{name}.jsonl"
        with path.open("w", encoding="utf-8") as f:
            for r in chunk:
                f.write(json.dumps(r, ensure_ascii=False) + "\n")
        counts[name] = len(chunk)
    return counts
