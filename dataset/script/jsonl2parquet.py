"""Freeze a shard directory of JSONL files into Parquet + dataset_info.json."""
from __future__ import annotations

import json
import os
from pathlib import Path


def jsonl2parquet(shard_dir: str | os.PathLike) -> dict[str, str]:
    try:
        import pyarrow as pa
        import pyarrow.parquet as pq
    except ImportError as e:
        raise ImportError("pyarrow is required; `pip install pyarrow`") from e

    shard_dir = Path(shard_dir)
    outputs: dict[str, str] = {}
    splits: dict[str, dict] = {}

    for jsonl in sorted(shard_dir.glob("*.jsonl")):
        rows = [json.loads(line) for line in jsonl.read_text(encoding="utf-8").splitlines() if line.strip()]
        if not rows:
            continue
        table = pa.Table.from_pylist(rows)
        parquet = jsonl.with_suffix(".parquet")
        pq.write_table(table, parquet)
        outputs[jsonl.stem] = str(parquet)
        splits[jsonl.stem] = {"num_examples": len(rows), "file": parquet.name}

    (shard_dir / "dataset_info.json").write_text(
        json.dumps({"splits": splits}, indent=2), encoding="utf-8"
    )
    return outputs


if __name__ == "__main__":
    import sys

    jsonl2parquet(sys.argv[1])
