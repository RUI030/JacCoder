"""§2 Per-checkpoint × per-dataset grad-norm matrix.

Forward + backward only (no optimizer step). For each stage checkpoint × slice:
  - global grad L2 norm
  - per-module (attn q/k/v/o, MLP up/gate/down) grad norm, A vs. B
  - per-layer grad norm
Also computes cross-slice grad cosine similarity per checkpoint (§3.5 in SPIKE).

Reuses SLICES from 01_loss_matrix.py. Adapter must be trainable
(inference_mode=False) — we bypass FastLanguageModel.for_inference().

Usage:
    python script/spike/02_gradnorm_matrix.py
    python script/spike/02_gradnorm_matrix.py --stage 8 --slice qa
    python script/spike/02_gradnorm_matrix.py --n-samples 32   # small, this is expensive
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch
import torch.nn.functional as F

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from spike_utils import (  # noqa: E402
    MODULE_TYPES, SLICES, adapter_dir, iter_stages, load_slice_samples, out_dir,
)


MAX_SEQ = 4096

_LAYER_RE = re.compile(r"model\.layers\.(\d+)\.")
_MOD_RE = re.compile(r"\.(q_proj|k_proj|v_proj|o_proj|gate_proj|up_proj|down_proj)\.")
_AB_RE = re.compile(r"\.lora_(A|B)\.")


def load_trainable_adapter(path: str):
    """Load adapter with gradients enabled (do NOT wrap for inference)."""
    from unsloth import FastLanguageModel
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=path, max_seq_length=MAX_SEQ, load_in_4bit=True, text_only=True,
        device_map={"": "cuda:0"},
    )
    # Keep training mode; ensure LoRA params require grad.
    model.train()
    for n, p in model.named_parameters():
        p.requires_grad_("lora_" in n)
    return model, tokenizer


def classify(name: str) -> tuple[int | None, str | None, str | None]:
    lm = _LAYER_RE.search(name)
    mm = _MOD_RE.search(name)
    am = _AB_RE.search(name)
    return (
        int(lm.group(1)) if lm else None,
        mm.group(1) if mm else None,
        am.group(1) if am else None,
    )


def one_batch_grads(model, tokenizer, messages: list[dict]) -> dict[str, float]:
    """Return {param_name: ||grad||^2} for one sample."""
    enc = tokenizer.apply_chat_template(
        messages, tokenize=True, add_generation_prompt=False,
        truncation=True, max_length=MAX_SEQ, return_tensors="pt", return_dict=True,
    )
    ids = enc["input_ids"].to("cuda")
    out = model(input_ids=ids, labels=ids)
    model.zero_grad(set_to_none=True)
    out.loss.backward()
    sq: dict[str, float] = {}
    for n, p in model.named_parameters():
        if p.grad is None:
            continue
        sq[n] = float((p.grad.detach() ** 2).sum())
    return sq


def summarize(sqs: list[dict[str, float]]) -> pd.DataFrame:
    """Average per-parameter squared grad, then group into rows."""
    keys = set().union(*[set(s) for s in sqs])
    mean_sq = {k: float(np.mean([s.get(k, 0.0) for s in sqs])) for k in keys}
    rows = []
    for name, ms in mean_sq.items():
        layer, mod, ab = classify(name)
        if mod is None:
            continue
        rows.append({
            "param": name, "layer": layer, "module": mod,
            "ab": ab, "grad_norm": float(np.sqrt(ms)),
        })
    return pd.DataFrame(rows)


def flat_grad_vector(sq_dict: dict[str, float], param_order: list[str]) -> np.ndarray:
    """Flatten to a fixed-length vector for cross-slice cosine."""
    return np.array([sq_dict.get(k, 0.0) for k in param_order], dtype=np.float32)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stage", type=int, default=None)
    ap.add_argument("--slice", type=str, default=None)
    ap.add_argument("--n-samples", type=int, default=32)
    args = ap.parse_args()

    od = out_dir("02_gradnorm_matrix")
    global_rows = []
    per_module_frames = []
    grad_vectors: dict[tuple[int, str], np.ndarray] = {}

    for stage in iter_stages(min_idx=3):
        if args.stage is not None and stage["idx"] != args.stage:
            continue
        path = str(adapter_dir(stage))
        print(f"[{stage['idx']}] {stage['name']}")
        model, tokenizer = load_trainable_adapter(path)
        param_order = [n for n, p in model.named_parameters() if p.requires_grad]

        stage_slice_vecs: dict[str, np.ndarray] = {}
        for slice_name in SLICES:
            if args.slice is not None and slice_name != args.slice:
                continue
            print(f"  slice: {slice_name}")
            samples = load_slice_samples(slice_name, args.n_samples)
            sq_dicts = [one_batch_grads(model, tokenizer, m) for m in samples]
            per_mod = summarize(sq_dicts)
            per_mod.insert(0, "stage_idx", stage["idx"])
            per_mod.insert(1, "slice", slice_name)
            per_module_frames.append(per_mod)

            global_norm = float(np.sqrt(sum(v for d in sq_dicts for v in d.values()) / len(sq_dicts)))
            global_rows.append({
                "stage_idx": stage["idx"], "slice": slice_name,
                "global_grad_norm": global_norm, "n": len(sq_dicts),
            })

            mean_sq = {k: float(np.mean([s.get(k, 0.0) for s in sq_dicts])) for k in param_order}
            stage_slice_vecs[slice_name] = flat_grad_vector(mean_sq, param_order)

        # cross-slice cosine per stage
        for a in stage_slice_vecs:
            for b in stage_slice_vecs:
                if a >= b:
                    continue
                va, vb = stage_slice_vecs[a], stage_slice_vecs[b]
                cos = float(np.dot(va, vb) / (np.linalg.norm(va) * np.linalg.norm(vb) + 1e-12))
                grad_vectors[(stage["idx"], f"{a}__{b}")] = np.array([cos], dtype=np.float32)

        del model, tokenizer
        torch.cuda.empty_cache()

    if global_rows:
        pd.DataFrame(global_rows).to_parquet(od / "global.parquet")
    if per_module_frames:
        pd.concat(per_module_frames, ignore_index=True).to_parquet(od / "per_module.parquet")
    if grad_vectors:
        cos_rows = [
            {"stage_idx": k[0], "pair": k[1], "cosine": float(v[0])}
            for k, v in grad_vectors.items()
        ]
        pd.DataFrame(cos_rows).to_parquet(od / "cross_slice_cosine.parquet")
    print(f"artifacts → {od}")


if __name__ == "__main__":
    main()
