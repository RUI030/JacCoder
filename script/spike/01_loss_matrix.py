"""§1 Per-checkpoint × per-dataset eval loss.

Loads each adapter on top of the base model, streams a fixed number of samples
from every labeled slice, and records mean CE + per-token-position loss.

Slices = the SFT valid.jsonl files under dataset/sft/*. Stages evaluated:
last CPT (stage 3) + all 5 SFT checkpoints. See SLICES/STAGES in spike_utils.

Usage:
    python script/spike/01_loss_matrix.py                   # all stages × all slices
    python script/spike/01_loss_matrix.py --stage 5
    python script/spike/01_loss_matrix.py --slice qa
    python script/spike/01_loss_matrix.py --n-samples 200
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch
import torch.nn.functional as F

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from utils.model import load_model  # noqa: E402

from spike_utils import (  # noqa: E402
    SLICES, adapter_dir, iter_stages, load_slice_samples, out_dir,
)


MAX_SEQ = 4096


@torch.inference_mode()
def per_position_loss(model, tokenizer, messages: list[dict], max_seq: int) -> torch.Tensor:
    """Return per-token CE (loss ignored on non-assistant tokens)."""
    enc = tokenizer.apply_chat_template(
        messages, tokenize=True, add_generation_prompt=False,
        truncation=True, max_length=max_seq, return_tensors="pt", return_dict=True,
    )
    ids = enc["input_ids"].to("cuda")
    out = model(input_ids=ids)
    logits = out.logits[:, :-1]
    targets = ids[:, 1:]
    ce = F.cross_entropy(
        logits.reshape(-1, logits.size(-1)),
        targets.reshape(-1),
        reduction="none",
    ).view(targets.shape)
    return ce[0].detach().float().cpu()


def eval_stage_slice(model, tokenizer, slice_name: str, n_samples: int) -> dict:
    samples = load_slice_samples(slice_name, n_samples)
    per_sample = []
    per_pos_buckets: dict[int, list[float]] = {}
    for msgs in samples:
        ce = per_position_loss(model, tokenizer, msgs, MAX_SEQ)
        per_sample.append(float(ce.mean()))
        for pos, v in enumerate(ce.tolist()):
            per_pos_buckets.setdefault(pos, []).append(v)
    positions = sorted(per_pos_buckets)
    pos_mean = np.array([np.mean(per_pos_buckets[p]) for p in positions], dtype=np.float32)
    return {
        "mean_loss": float(np.mean(per_sample)),
        "n": len(per_sample),
        "pos_index": np.array(positions, dtype=np.int32),
        "pos_mean": pos_mean,
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stage", type=int, default=None)
    ap.add_argument("--slice", type=str, default=None)
    ap.add_argument("--n-samples", type=int, default=100)
    args = ap.parse_args()

    od = out_dir("01_loss_matrix")
    rows = []
    for stage in iter_stages(min_idx=3):
        if args.stage is not None and stage["idx"] != args.stage:
            continue
        adapter_path = adapter_dir(stage)
        print(f"[{stage['idx']}] loading {stage['name']}")
        model, tokenizer = load_model(
            str(adapter_path), max_seq_length=MAX_SEQ, device_map={"": "cuda:0"},
        )

        for slice_name in SLICES:
            if args.slice is not None and slice_name != args.slice:
                continue
            print(f"  slice: {slice_name}")
            res = eval_stage_slice(model, tokenizer, slice_name, args.n_samples)
            rows.append({
                "stage_idx": stage["idx"],
                "stage_name": stage["name"],
                "kind": stage["kind"],
                "slice": slice_name,
                "mean_loss": res["mean_loss"],
                "n": res["n"],
            })
            np.savez_compressed(
                od / f"pos_stage{stage['idx']:02d}_{slice_name}.npz",
                pos_index=res["pos_index"], pos_mean=res["pos_mean"],
            )

        del model, tokenizer
        torch.cuda.empty_cache()

    if rows:
        pd.DataFrame(rows).to_parquet(od / "loss_matrix.parquet")
        print(f"loss matrix → {od / 'loss_matrix.parquet'}")


if __name__ == "__main__":
    main()
