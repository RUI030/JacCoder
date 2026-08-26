"""Shared helpers for spike scripts: adapter iteration, module walk, io."""

from __future__ import annotations

import json
import random
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator

import numpy as np
from safetensors import safe_open


REPO_ROOT = Path(__file__).resolve().parents[2]
ADAPTER_ROOT = REPO_ROOT / "output" / "adapter"
DATASET_ROOT = REPO_ROOT / "dataset" / "sft"
OUT_ROOT = Path(__file__).resolve().parent / "out"

# Full sequential training chain. §1/§2 skip stages 1-2 (no matching valid.jsonl);
# §3 SVD uses all 8 to see CPT-only evolution before SFT begins.
STAGES: list[dict] = [
    {"idx": 1, "kind": "cpt", "name": "08-24_13-54-Ayush-ground-truth-train"},
    {"idx": 2, "kind": "cpt", "name": "08-24_15-21-Ayush-ground-truth-valid"},
    {"idx": 3, "kind": "cpt", "name": "08-24_16-57-Nitin-10k-jac-functions"},
    {"idx": 4, "kind": "sft", "name": "08-24_18-37-sft-code_completion-Nitin-10k-jac-functions"},
    {"idx": 5, "kind": "sft", "name": "08-24_19-41-sft-js2jac-Nitin-js2jac"},
    {"idx": 6, "kind": "sft", "name": "08-24_20-54-sft-py2jac-opus-synth-v2"},
    {"idx": 7, "kind": "sft", "name": "08-24_21-17-sft-code_gen-opus-synth-v2"},
    {"idx": 8, "kind": "sft", "name": "08-24_21-30-sft-qa-opus-synth-v2"},
]

# Eval slices: name -> path to valid.jsonl (rows are `{"messages": [...]}`).
SLICES: dict[str, Path] = {
    "code_completion": DATASET_ROOT / "code_completion" / "Nitin-10k-jac-functions" / "valid.jsonl",
    "code_gen":        DATASET_ROOT / "code_gen" / "opus-synth-v2" / "valid.jsonl",
    "js2jac":          DATASET_ROOT / "js2jac" / "Nitin-js2jac" / "valid.jsonl",
    "py2jac":          DATASET_ROOT / "py2jac" / "opus-synth-v2" / "valid.jsonl",
    "qa":              DATASET_ROOT / "qa" / "opus-synth-v2" / "valid.jsonl",
}

MODULE_TYPES = ["q_proj", "k_proj", "v_proj", "o_proj", "gate_proj", "up_proj", "down_proj"]


def load_slice_samples(slice_name: str, n: int, seed: int = 0) -> list[list[dict]]:
    """Return up to `n` chat message-lists from `SLICES[slice_name]`."""
    path = SLICES[slice_name]
    with path.open() as f:
        rows = [json.loads(line) for line in f if line.strip()]
    rng = random.Random(seed)
    rng.shuffle(rows)
    return [r["messages"] for r in rows[:n]]

# Matches keys like `base_model.model.model.layers.12.self_attn.q_proj.lora_A.weight`
_LORA_KEY = re.compile(
    r"model\.layers\.(?P<layer>\d+)\."
    r"(?:self_attn|mlp)\."
    r"(?P<module>q_proj|k_proj|v_proj|o_proj|gate_proj|up_proj|down_proj)\."
    r"lora_(?P<ab>A|B)\.(?:default\.)?weight"
)


@dataclass
class AdapterTensors:
    """Grouped LoRA A/B tensors from one adapter checkpoint."""

    stage: dict
    r: int
    alpha: int
    scaling: float
    # (layer_idx, module_type) -> {"A": np.ndarray[r, in], "B": np.ndarray[out, r]}
    pairs: dict[tuple[int, str], dict[str, np.ndarray]]

    def modules(self) -> Iterator[tuple[int, str, np.ndarray, np.ndarray]]:
        for (layer, mod), ab in sorted(self.pairs.items()):
            if "A" in ab and "B" in ab:
                yield layer, mod, ab["A"], ab["B"]


def adapter_dir(stage: dict) -> Path:
    return ADAPTER_ROOT / stage["name"] / "adapter"


def load_adapter(stage: dict) -> AdapterTensors:
    """Load LoRA A/B matrices from an adapter checkpoint's safetensors."""
    d = adapter_dir(stage)
    cfg = json.loads((d / "adapter_config.json").read_text())
    r = int(cfg["r"])
    alpha = int(cfg["lora_alpha"])
    scaling = alpha / r

    pairs: dict[tuple[int, str], dict[str, np.ndarray]] = {}
    st = d / "adapter_model.safetensors"
    with safe_open(str(st), framework="numpy") as f:
        for key in f.keys():
            m = _LORA_KEY.search(key)
            if not m:
                continue
            layer = int(m["layer"])
            mod = m["module"]
            ab = m["ab"]
            pairs.setdefault((layer, mod), {})[ab] = f.get_tensor(key)

    return AdapterTensors(stage=stage, r=r, alpha=alpha, scaling=scaling, pairs=pairs)


def iter_stages(min_idx: int = 0) -> Iterator[dict]:
    """Yield stages whose adapter exists on disk. `min_idx` filters early stages;
    01/02 use min_idx=3 to skip Ayush noise (no matching eval slice)."""
    for s in STAGES:
        if s["idx"] < min_idx:
            continue
        if adapter_dir(s).exists():
            yield s
        else:
            print(f"[skip] adapter missing: {s['name']}")


def out_dir(script_name: str) -> Path:
    p = OUT_ROOT / script_name
    p.mkdir(parents=True, exist_ok=True)
    return p


def save_npz(path: Path, **arrays) -> None:
    np.savez_compressed(path, **arrays)


def save_json(path: Path, obj) -> None:
    path.write_text(json.dumps(obj, indent=2, default=float))


# -------- Low-rank SVD of ΔW = scaling · B · A --------
#
# ΔW is [out, in] with rank ≤ r (LoRA), so a full SVD is wasteful.
# Instead: thin-QR A^T = Q_A · R_A (Q_A [in,r], R_A [r,r]),
#          then ΔW = scaling · B · R_A^T · Q_A^T.
# Let M = scaling · B · R_A^T (shape [out,r]); SVD(M) = U · Σ · V_M^T.
# Full ΔW SVD: U [out,r], Σ [r], V = Q_A · V_M [in,r]. Same singular values
# and (up to sign) same singular vectors as SVD(ΔW), ~100× faster.


def lowrank_svd(A: np.ndarray, B: np.ndarray, scaling: float, keep_uv: bool = True):
    """Compact SVD of ΔW = scaling·B·A without materializing ΔW.

    Returns (U [out,r], s [r], V [in,r]).  If keep_uv=False returns (None, s, None).
    """
    A = A.astype(np.float32, copy=False)
    B = B.astype(np.float32, copy=False)
    # A: [r, in]  ->  A^T = Q_A · R_A,  Q_A [in,r], R_A [r,r]
    Q_A, R_A = np.linalg.qr(A.T, mode="reduced")
    M = scaling * (B @ R_A.T)                       # [out, r]
    if keep_uv:
        U, s, Vt_M = np.linalg.svd(M, full_matrices=False)
        V = Q_A @ Vt_M.T                            # [in, r]
        return U.astype(np.float32), s.astype(np.float32), V.astype(np.float32)
    s = np.linalg.svd(M, compute_uv=False)
    return None, s.astype(np.float32), None


def svd_scalars(s: np.ndarray) -> dict:
    """Metrics derivable from the spectrum alone."""
    s = s.astype(np.float32)
    fro2 = float((s ** 2).sum())
    spectral = float(s[0]) if s.size else 0.0
    stable_rank = fro2 / (spectral ** 2) if spectral > 0 else 0.0
    p = (s ** 2) / max(fro2, 1e-12)
    entropy = float(-(p * np.log(p + 1e-12)).sum())
    participation = float(np.exp(entropy))
    dead = int((s / max(spectral, 1e-12) < 1e-3).sum())
    last = float(s[-1]) if s.size else 0.0
    return {
        "sigma": s,
        "fro": float(np.sqrt(fro2)),
        "spectral": spectral,
        "stable_rank": stable_rank,
        "participation": participation,
        "dead_rank": dead,
        "cond": float(s[0] / last) if last > 0 else float("inf"),
    }


def principal_angles(U1: np.ndarray, U2: np.ndarray) -> np.ndarray:
    """cos of principal angles between subspaces (columns are basis vectors)."""
    Q1, _ = np.linalg.qr(U1)
    Q2, _ = np.linalg.qr(U2)
    s = np.linalg.svd(Q1.T @ Q2, compute_uv=False)
    return np.clip(s, -1.0, 1.0)
