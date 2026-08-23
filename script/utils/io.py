"""Shared I/O helpers for dataset scripts."""

from pathlib import Path
from datasets import load_dataset


def load_jac(fp) -> str:
    """Read Jac source; json.dump handles special characters later."""
    return Path(fp).read_text(encoding="utf-8")


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
