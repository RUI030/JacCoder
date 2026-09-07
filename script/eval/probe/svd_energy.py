"""Singular-value energy per LoRA layer.

For each adapted layer computes SVD of ΔW = B @ A, then reports the
smallest k where cumulative σ² reaches each threshold. Aggregates per
module (q_proj / k_proj / …) and overall.
"""

import argparse, json
from collections import defaultdict
from pathlib import Path

import numpy as np
from safetensors import safe_open

THRESHOLDS = [0.5, 0.8, 0.9, 0.95, 0.99]

ap = argparse.ArgumentParser()
ap.add_argument("--adapter", required=True, help="path to adapter dir or adapter_model.safetensors")
ap.add_argument("--out", default=None)
args = ap.parse_args()

p = Path(args.adapter)
if p.is_dir(): p = p / "adapter_model.safetensors"

tensors = {}
with safe_open(str(p), framework="pt", device="cpu") as f:
    for k in f.keys():
        tensors[k] = f.get_tensor(k)

layers = {}
for k, v in tensors.items():
    if ".lora_A." in k:
        base = k.split(".lora_A.")[0]
        layers.setdefault(base, {})["A"] = v.float().numpy()
    elif ".lora_B." in k:
        base = k.split(".lora_B.")[0]
        layers.setdefault(base, {})["B"] = v.float().numpy()

results = []
for name, ab in layers.items():
    if "A" not in ab or "B" not in ab:
        continue
    B, A = ab["B"], ab["A"]                       # (d,r), (r,k) — rank <= r
    Q, R = np.linalg.qr(B)                        # Q:(d,r), R:(r,r)
    s = np.linalg.svd(R @ A, compute_uv=False)    # svd of (r,k) — cheap
    e = s ** 2
    cum = np.cumsum(e) / e.sum()
    rec = {"name": name, "r_max": int(len(s))}
    for t in THRESHOLDS:
        rec[f"r@{t}"] = int(np.searchsorted(cum, t) + 1)
    rec["top1_frac"] = float(e[0] / e.sum())
    results.append(rec)

by_mod = defaultdict(list)
for r in results:
    by_mod[r["name"].split(".")[-1]].append(r)

print(f"adapter : {p}")
print(f"layers  : {len(results)}\n")

hdr = f"{'module':<14} {'n':>4} " + " ".join(f"r@{t}(med/p90)".rjust(16) for t in THRESHOLDS)
print(hdr)
print("-" * len(hdr))
for mod, rs in sorted(by_mod.items()):
    row = f"{mod:<14} {len(rs):>4} "
    for t in THRESHOLDS:
        vals = [r[f"r@{t}"] for r in rs]
        row += f"{int(np.median(vals)):>8}/{int(np.percentile(vals,90)):>4}   "
    print(row)

print(f"\nOverall ({len(results)} layers, r_max={results[0]['r_max']}):")
for t in THRESHOLDS:
    vals = [r[f"r@{t}"] for r in results]
    print(f"  r@{t}: median={int(np.median(vals))}  mean={np.mean(vals):5.1f}  "
          f"min={min(vals)}  max={max(vals)}")

out = Path(args.out) if args.out else Path("output/eval/svd") / f"{p.parent.parent.name}.json"
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(json.dumps(
    {"adapter": str(p), "thresholds": THRESHOLDS, "layers": results}, indent=2))
print(f"\nwrote {out}")
