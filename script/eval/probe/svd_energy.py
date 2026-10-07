"""Singular-value energy per LoRA layer, for one adapter or several side by side.

For each adapted layer computes SVD of ΔW = scale · B @ A (scale = alpha/√r with
rsLoRA, alpha/r without), then reports the smallest k where cumulative σ² reaches
each threshold, aggregated per module (q_proj / k_proj / …) and overall.
With several adapters it also compares the singular-value decay: the median
normalized spectrum σ_i/σ_1 and cumulative energy per index, the median ‖ΔW‖_F,
and (with --plot) both curves in one figure.
"""

import argparse, json
from collections import defaultdict
from pathlib import Path

import numpy as np
from safetensors import safe_open

THRESHOLDS = [0.5, 0.8, 0.9, 0.95, 0.99]
SHOW_INDEX = [1, 2, 4, 8, 16, 32, 64]


def lora_scale(adapter_dir: Path) -> float:
    cfg_file = adapter_dir / "adapter_config.json"
    if not cfg_file.exists():
        return 1.0
    cfg = json.loads(cfg_file.read_text())
    r, alpha = cfg["r"], cfg["lora_alpha"]
    return alpha / (r ** 0.5 if cfg.get("use_rslora") else r)


def spectra(adapter: str) -> tuple[Path, list[dict]]:
    """Per-layer singular values of ΔW for one adapter dir or adapter_model.safetensors."""
    p = Path(adapter)
    if p.is_dir():
        p = p / "adapter_model.safetensors"
    scale = lora_scale(p.parent)
    layers = defaultdict(dict)
    with safe_open(str(p), framework="pt", device="cpu") as f:
        for k in f.keys():
            for part in ("A", "B"):
                if f".lora_{part}." in k:
                    layers[k.split(f".lora_{part}.")[0]][part] = f.get_tensor(k).float().numpy()
    results = []
    for name, ab in layers.items():
        if "A" not in ab or "B" not in ab:
            continue
        B, A = ab["B"], ab["A"]                       # (d,r), (r,k): rank <= r
        _, R = np.linalg.qr(B)                        # R:(r,r)
        s = scale * np.linalg.svd(R @ A, compute_uv=False)
        e = s ** 2
        cum = np.cumsum(e) / e.sum()
        rec = {"name": name, "r_max": int(len(s)), "fro": float(np.sqrt(e.sum())),
               "top1_frac": float(e[0] / e.sum()), "sigma": s.tolist()}
        for t in THRESHOLDS:
            rec[f"r@{t}"] = int(np.searchsorted(cum, t) + 1)
        results.append(rec)
    return p, results


def report(p: Path, results: list[dict]) -> None:
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
            row += f"{int(np.median(vals)):>8}/{int(np.percentile(vals, 90)):>4}   "
        print(row)
    print(f"\nOverall ({len(results)} layers, r_max={results[0]['r_max']}):")
    for t in THRESHOLDS:
        vals = [r[f"r@{t}"] for r in results]
        print(f"  r@{t}: median={int(np.median(vals))}  mean={np.mean(vals):5.1f}  "
              f"min={min(vals)}  max={max(vals)}")
    print()


def decay(results: list[dict]) -> tuple[np.ndarray, np.ndarray]:
    """Median over layers of σ_i/σ_1 and of cumulative energy, per index i."""
    sig = np.array([r["sigma"] for r in results])
    norm = sig / sig[:, :1]
    cum = np.cumsum(sig ** 2, axis=1) / (sig ** 2).sum(axis=1, keepdims=True)
    return np.median(norm, axis=0), np.median(cum, axis=0)


def compare(runs: list[tuple[str, list[dict]]], plot: str | None) -> None:
    print("Singular-value decay (median over layers)\n")
    idx = [i for i in SHOW_INDEX if i <= min(len(r[0]["sigma"]) for _, r in runs)]
    print(f"{'adapter':<40} {'‖ΔW‖_F':>8} " + " ".join(f"σ{i}/σ1".rjust(8) for i in idx)
          + "  " + " ".join(f"E≤{i}".rjust(6) for i in idx))
    curves = []
    for label, results in runs:
        norm, cum = decay(results)
        curves.append((label, norm, cum))
        fro = np.median([r["fro"] for r in results])
        print(f"{label[-40:]:<40} {fro:>8.4f} " + " ".join(f"{norm[i - 1]:>8.3f}" for i in idx)
              + "  " + " ".join(f"{cum[i - 1]:>6.2f}" for i in idx))
    if plot:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        fig, (a1, a2) = plt.subplots(1, 2, figsize=(11, 4))
        for label, norm, cum in curves:
            x = np.arange(1, len(norm) + 1)
            a1.semilogy(x, norm, label=label)
            a2.plot(x, cum, label=label)
        a1.set(xlabel="index i", ylabel="median σ_i / σ_1", title="Normalized singular values")
        a2.set(xlabel="index i", ylabel="median cumulative energy", title="Cumulative σ² energy", ylim=(0, 1.02))
        a1.legend(fontsize=8)
        fig.tight_layout()
        Path(plot).parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(plot, dpi=150)
        print(f"\nwrote {plot}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--adapter", required=True, nargs="+",
                    help="adapter dir(s) or adapter_model.safetensors; several = compare their decay")
    ap.add_argument("--label", nargs="+", help="names for the adapters (default: path)")
    ap.add_argument("--out", default=None, help="JSON path (single adapter) or directory (several)")
    ap.add_argument("--plot", default=None, help="PNG with both decay curves (several adapters)")
    args = ap.parse_args()

    runs = []
    for i, a in enumerate(args.adapter):
        p, results = spectra(a)
        report(p, results)
        label = args.label[i] if args.label else str(p.parent)
        runs.append((label, results))
        name = f"{p.parent.parent.name}.json"
        out = (Path(args.out) / name if len(args.adapter) > 1 else Path(args.out)) if args.out \
            else Path("output/eval/svd") / name
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(json.dumps({"adapter": str(p), "thresholds": THRESHOLDS, "layers": results}, indent=2))
        print(f"wrote {out}\n")
    if len(runs) > 1:
        compare(runs, args.plot)
