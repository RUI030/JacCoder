"""Shared record-writing pipeline for CPT/SFT dataset producers.

Every dataset script builds a list of records (each a dict ready to write),
then splits + writes them. This module owns the split+write half so each
script only has to know how to turn one raw sample into one record.
"""

import json
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))
from utils.io import json2parquet


def load_prompts(path, *keys: str) -> dict:
    """Load prompt_template.json; raise if any requested key is missing/empty."""
    tpl = json.loads(Path(path).read_text(encoding="utf-8"))
    missing = [k for k in keys if not tpl.get(k)]
    if missing:
        raise ValueError(f"Missing {missing} in prompt template: {path}")
    return {k: tpl[k] for k in keys}


def split_and_write(records: list[dict], out_dir, valid_size: float,
                    format: str = "jsonl") -> dict[str, int]:
    """Split an already-shuffled list of records into train/valid and write.

    `valid_size=0.0` writes only train.jsonl (CPT mode). Otherwise writes both,
    with the first `int(N * valid_size)` rows going to valid.jsonl. When
    `format="parquet"`, JSONL is converted to Parquet in the same directory.

    Returns `{split_name: row_count}`.
    """
    out_dir = Path(out_dir)
    n_valid = int(len(records) * valid_size)
    splits  = {"train": records[n_valid:]}
    if n_valid > 0:
        splits["valid"] = records[:n_valid]

    out_dir.mkdir(parents=True, exist_ok=True)
    counts: dict[str, int] = {}
    for split, rows in splits.items():
        with (out_dir / f"{split}.jsonl").open("w", encoding="utf-8") as f:
            for row in rows:
                json.dump(row, f, ensure_ascii=False)
                f.write("\n")
        counts[split] = len(rows)

    if format == "parquet":
        json2parquet(out_dir, out_dir)
    return counts


def report(counts: dict[str, int], out_dir) -> None:
    """Consistent completion message across all dataset scripts."""
    train = counts.get("train", 0)
    valid = counts.get("valid", 0)
    print(f"Created {train} train and {valid} validation samples in {out_dir}")
    if valid == 0:
        print("  (VALID_SIZE=0, valid.jsonl skipped — CPT mode)")
