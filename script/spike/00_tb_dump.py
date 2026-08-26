"""§0 Dump training-time scalars from TensorBoard event files.

Training runs logged train loss + global grad_norm (no eval — OOM).
This script walks `output/adapter/*/runs/*/` and dumps every scalar to one
long-format parquet so the notebook can plot per-stage curves.

Usage:
    pip install tensorboard          # if missing
    python script/spike/00_tb_dump.py
"""

from __future__ import annotations

from pathlib import Path

import pandas as pd

from spike_utils import ADAPTER_ROOT, STAGES, out_dir


def stage_by_dirname(name: str) -> dict | None:
    for s in STAGES:
        if s["name"] == name:
            return s
    return None


def main():
    from tensorboard.backend.event_processing.event_accumulator import EventAccumulator

    rows = []
    for adapter_root in sorted(ADAPTER_ROOT.iterdir()):
        runs = adapter_root / "runs"
        if not runs.is_dir():
            continue
        stage = stage_by_dirname(adapter_root.name)
        for run_dir in sorted(runs.iterdir()):
            print(f"[{adapter_root.name}] {run_dir.name}")
            ea = EventAccumulator(str(run_dir))
            ea.Reload()
            for tag in ea.Tags().get("scalars", []):
                for ev in ea.Scalars(tag):
                    rows.append({
                        "stage_idx": stage["idx"] if stage else -1,
                        "stage_name": adapter_root.name,
                        "kind": stage["kind"] if stage else "unknown",
                        "run": run_dir.name,
                        "tag": tag,
                        "step": ev.step,
                        "wall_time": ev.wall_time,
                        "value": ev.value,
                    })

    if not rows:
        print("no scalars found")
        return
    df = pd.DataFrame(rows)
    od = out_dir("00_tb_dump")
    df.to_parquet(od / "tb_scalars.parquet")
    print(f"{len(df)} rows across {df.tag.nunique()} tags → {od / 'tb_scalars.parquet'}")
    print("tags:", sorted(df.tag.unique()))


if __name__ == "__main__":
    main()
