"""§3 Adapter SVD + layer analysis.

For each of the 8 sequential adapters, per module:
  ΔW = scaling * B @ A
  → SVD spectrum, norms, direction/drift vs. prev stage, alignment.

Writes per-stage npz + a long-format parquet ready for the notebook.

Usage:
    python script/spike/03_adapter_svd.py            # all stages
    python script/spike/03_adapter_svd.py --stage 5  # one stage (by idx)
    python script/spike/03_adapter_svd.py --topk 32  # subspace-overlap k
"""

from __future__ import annotations

import argparse
from pathlib import Path

import numpy as np
import pandas as pd

from spike_utils import (
    AdapterTensors,
    iter_stages,
    load_adapter,
    lowrank_svd,
    out_dir,
    principal_angles,
    save_npz,
    svd_scalars,
)


def analyze_stage(adapter: AdapterTensors, topk: int) -> tuple[pd.DataFrame, dict]:
    """Per-module scalars → DataFrame; per-module top-k U/V + spectra → dict of arrays."""
    rows = []
    arrays: dict[str, np.ndarray] = {}
    for layer, mod, A, B in adapter.modules():
        U, s, V = lowrank_svd(A, B, adapter.scaling, keep_uv=True)
        summ = svd_scalars(s)
        k = min(topk, U.shape[1])
        U_k, V_k = U[:, :k], V[:, :k]

        key = f"L{layer:02d}_{mod}"
        arrays[f"{key}__sigma"] = summ["sigma"]
        arrays[f"{key}__U"] = U_k
        arrays[f"{key}__V"] = V_k

        rows.append({
            "stage_idx": adapter.stage["idx"],
            "stage_name": adapter.stage["name"],
            "kind": adapter.stage["kind"],
            "layer": layer,
            "module": mod,
            "fro": summ["fro"],
            "spectral": summ["spectral"],
            "stable_rank": summ["stable_rank"],
            "participation": summ["participation"],
            "dead_rank": summ["dead_rank"],
            "cond": summ["cond"],
            "A_fro": float(np.linalg.norm(A)),
            "B_fro": float(np.linalg.norm(B)),
            "r": adapter.r,
            "alpha": adapter.alpha,
        })
    return pd.DataFrame(rows), arrays


def drift_vs_prev(prev_arr: dict[str, np.ndarray], curr_arr: dict[str, np.ndarray]) -> pd.DataFrame:
    """Cross-stage subspace overlap + direction cosine per module."""
    rows = []
    keys = {k.rsplit("__", 1)[0] for k in curr_arr}
    for key in sorted(keys):
        u_key = f"{key}__U"
        if u_key not in prev_arr:
            continue
        cos_angles = principal_angles(prev_arr[u_key], curr_arr[u_key])
        v_angles = principal_angles(prev_arr[f"{key}__V"], curr_arr[f"{key}__V"])
        layer_str, mod = key[1:].split("_", 1)
        rows.append({
            "module_key": key,
            "layer": int(layer_str),
            "module": mod,
            "U_overlap_mean": float(cos_angles.mean()),
            "U_overlap_min": float(cos_angles.min()),
            "V_overlap_mean": float(v_angles.mean()),
            "V_overlap_min": float(v_angles.min()),
        })
    return pd.DataFrame(rows)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stage", type=int, default=None, help="only process stage idx")
    ap.add_argument("--topk", type=int, default=32, help="k for subspace overlap")
    args = ap.parse_args()

    od = out_dir("03_adapter_svd")
    all_scalars: list[pd.DataFrame] = []
    all_drift: list[pd.DataFrame] = []
    prev_arrays: dict[str, np.ndarray] | None = None
    prev_stage_idx: int | None = None

    for stage in iter_stages():
        if args.stage is not None and stage["idx"] != args.stage:
            continue
        print(f"[{stage['idx']}] {stage['name']}")
        adapter = load_adapter(stage)
        df, arrays = analyze_stage(adapter, args.topk)
        all_scalars.append(df)

        stage_npz = od / f"stage_{stage['idx']:02d}_arrays.npz"
        save_npz(stage_npz, **arrays)

        if prev_arrays is not None:
            ddf = drift_vs_prev(prev_arrays, arrays)
            ddf.insert(0, "from_stage", prev_stage_idx)
            ddf.insert(1, "to_stage", stage["idx"])
            all_drift.append(ddf)

        prev_arrays = arrays
        prev_stage_idx = stage["idx"]

    if all_scalars:
        scalars = pd.concat(all_scalars, ignore_index=True)
        scalars.to_parquet(od / "scalars.parquet")
        print(f"scalars: {len(scalars)} rows → {od / 'scalars.parquet'}")
    if all_drift:
        drift = pd.concat(all_drift, ignore_index=True)
        drift.to_parquet(od / "drift.parquet")
        print(f"drift: {len(drift)} rows → {od / 'drift.parquet'}")


if __name__ == "__main__":
    main()
