"""Shared I/O helpers for dataset scripts."""

import json
from pathlib import Path
from typing import Iterator

from datasets import load_dataset


def load_jac(fp) -> str:
    """Read Jac source; json.dump handles special characters later."""
    return Path(fp).read_text(encoding="utf-8")


def iter_sources(
    in_dir, raw_root,
    json_keyword: str = "jac",
    fp_key: str = "id",
    extra_keys: tuple[str, ...] = (),
) -> Iterator[tuple[str, str, dict]]:
    """Yield (fp, jac, extras) for every training sample in `in_dir`.

    JSONL mode (any *.jsonl under `in_dir`): pull `record[json_keyword]` as
    the Jac source. `fp` = `record[fp_key]` when present, else
    `<rel_path>#<line_idx>`. `extras` = {k: record[k] for k in extra_keys}.

    File mode (otherwise): every *.jac file; `fp` = relative path;
    `extras` is always empty.
    """
    in_dir   = Path(in_dir)
    raw_root = Path(raw_root)

    jsonl_files = sorted(in_dir.rglob("*.jsonl"))
    if jsonl_files:
        for jf in jsonl_files:
            rel = jf.relative_to(raw_root).as_posix()
            with jf.open("r", encoding="utf-8") as f:
                for idx, line in enumerate(f):
                    line = line.strip()
                    if not line:
                        continue
                    rec = json.loads(line)
                    jac = rec.get(json_keyword)
                    if not jac:
                        continue
                    fp = rec.get(fp_key) or f"{rel}#{idx}"
                    extras = {k: rec.get(k) for k in extra_keys}
                    yield fp, jac, extras
        return

    for p in sorted(in_dir.rglob("*.jac")):
        if not p.is_file():
            continue
        yield p.relative_to(raw_root).as_posix(), load_jac(p), {}


def json2parquet(in_dir, out_dir=None):
    """Convert every JSONL split in a directory to Parquet."""
    in_dir = Path(in_dir)
    out_dir = Path(out_dir) if out_dir else in_dir
    out_dir.mkdir(parents=True, exist_ok=True)

    files = sorted(in_dir.glob("*.jsonl"))
    if not files:
        raise FileNotFoundError(f"No JSONL files found in: {in_dir}")

    for file_path in files:
        ds = load_dataset("json", data_files=str(file_path), split="train")
        ds.to_parquet(f"{out_dir}/{file_path.stem}.parquet")
