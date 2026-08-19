"""Per-shard stats reports (Markdown + JSON) written next to the shard."""
from __future__ import annotations

import json
import os
from collections import Counter
from pathlib import Path

from . import chunking


def _percentile(sorted_values: list[int], p: float) -> int:
    if not sorted_values:
        return 0
    k = max(0, min(len(sorted_values) - 1, int(round((p / 100) * (len(sorted_values) - 1)))))
    return sorted_values[k]


def statistic(shard_dir: str | os.PathLike, tokenizer: str = "gpt2") -> dict:
    shard_dir = Path(shard_dir)
    per_split: dict[str, dict] = {}

    for jsonl in sorted(shard_dir.glob("*.jsonl")):
        rows = [json.loads(l) for l in jsonl.read_text(encoding="utf-8").splitlines() if l.strip()]
        token_counts = [chunking.count_tokens(r["text"], tokenizer) for r in rows]
        token_counts_sorted = sorted(token_counts)
        classes = Counter(r.get("meta", {}).get("class", "unknown") for r in rows)
        sources = Counter(r.get("meta", {}).get("source", "unknown") for r in rows)
        per_split[jsonl.stem] = {
            "rows": len(rows),
            "tokens_total": sum(token_counts),
            "tokens_p50": _percentile(token_counts_sorted, 50),
            "tokens_p90": _percentile(token_counts_sorted, 90),
            "tokens_p99": _percentile(token_counts_sorted, 99),
            "class_mix": dict(classes),
            "source_mix": dict(sources),
        }

    name = shard_dir.name
    (shard_dir.parent / f"{name}.json").write_text(
        json.dumps(per_split, indent=2), encoding="utf-8"
    )
    (shard_dir.parent / f"{name}.md").write_text(_render_md(name, per_split), encoding="utf-8")
    return per_split


def _render_md(name: str, per_split: dict) -> str:
    lines = [f"# `{name}` stats", ""]
    for split, s in per_split.items():
        lines += [
            f"## {split}",
            f"- rows: **{s['rows']}**",
            f"- tokens: total **{s['tokens_total']}**, p50 {s['tokens_p50']}, p90 {s['tokens_p90']}, p99 {s['tokens_p99']}",
            f"- class mix: {s['class_mix']}",
            f"- source mix: {s['source_mix']}",
            "",
        ]
    return "\n".join(lines)


if __name__ == "__main__":
    import sys

    statistic(sys.argv[1])
