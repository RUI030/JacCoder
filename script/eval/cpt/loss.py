import argparse, gc, json, sys
from pathlib import Path
from statistics import mean

import unsloth  # must precede transformers/peft to enable optimizations
import torch

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.model import load_model

# Setting =================================================
BASE_MODEL     = "ornith-ai/Ornith-1.5-9B"
MAX_SEQ_LENGTH = 4096
LOAD_IN_4BIT   = True

RUN_DIR  = ""             # required: e.g. output/adapter/08-24_11-17-Ayush-ground-truth
DATASET  = "Nitin-10k-jac-functions"
VALID_FP = ""             # empty => auto from dataset/cpt/<DATASET>/valid.jsonl
LIMIT    = 0              # 0 => all valid records

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent

# CLI overrides ============================================
_ap = argparse.ArgumentParser(add_help=False)
_ap.add_argument("--run",   dest="run",     help="training run dir (contains checkpoint-*/adapter/)")
_ap.add_argument("--ds",    dest="dataset")
_ap.add_argument("--valid", dest="valid",   help="explicit valid.jsonl path")
_ap.add_argument("--limit", type=int)
_args, _ = _ap.parse_known_args()
if _args.run:     RUN_DIR  = _args.run
if _args.dataset: DATASET  = _args.dataset
if _args.valid:   VALID_FP = _args.valid
if _args.limit:   LIMIT    = _args.limit

if not RUN_DIR:
    raise SystemExit("Provide --run or set RUN_DIR at top of file")
if not VALID_FP:
    VALID_FP = str(PROJECT_ROOT / "dataset" / "cpt" / DATASET / "valid.jsonl")


# Functions ===============================================
def load_records(fp, limit=0):
    recs = []
    with open(fp, encoding="utf-8") as f:
        for i, line in enumerate(f):
            if limit and i >= limit:
                break
            line = line.strip()
            if line:
                recs.append(json.loads(line))
    return recs


def compute_losses(model, tokenizer, records):
    """Per-record NLL loss (forward-only)."""
    losses = []
    for rec in records:
        text = rec.get("text", "")
        if not text:
            continue
        enc = tokenizer(
            text, return_tensors="pt",
            truncation=True, max_length=MAX_SEQ_LENGTH,
        ).to("cuda")
        with torch.inference_mode():
            out = model(**enc, labels=enc["input_ids"])
        losses.append(out.loss.item())
    return losses


def find_checkpoints(run_dir):
    """Sorted checkpoint-* dirs, followed by the final `adapter/` if present."""
    run = Path(run_dir)
    ckpts = sorted(
        run.glob("checkpoint-*"),
        key=lambda p: int(p.name.split("-")[-1]),
    )
    final = run / "adapter"
    if final.is_dir():
        ckpts.append(final)
    return ckpts


# Run =====================================================
if __name__ == "__main__":
    records = load_records(VALID_FP, LIMIT)
    if not records:
        raise SystemExit(f"No records in {VALID_FP}")
    print(f"Valid: {VALID_FP}")
    print(f"Records: {len(records)}")

    checkpoints = find_checkpoints(RUN_DIR)
    if not checkpoints:
        raise SystemExit(f"No checkpoints in {RUN_DIR}")
    print(f"Checkpoints: {len(checkpoints)}")

    results = []
    for ckpt in checkpoints:
        print(f"\n=== {ckpt.name} ===")
        # Let unsloth load base+adapter (matches training path, no key mismatch).
        # Force device_map to keep everything on the primary GPU (default map
        # spills to CPU which bnb 4-bit rejects).
        model, tokenizer = load_model(
            str(ckpt), MAX_SEQ_LENGTH, LOAD_IN_4BIT,
            device_map={"": "cuda:0"},
        )
        model.eval()
        losses = compute_losses(model, tokenizer, records)
        m = mean(losses) if losses else float("nan")
        print(f"  mean_loss = {m:.4f}  (n={len(losses)})")
        results.append({
            "checkpoint": ckpt.name,
            "path": str(ckpt),
            "n": len(losses),
            "mean_loss": m,
        })
        del model, tokenizer
        gc.collect()
        torch.cuda.empty_cache()
        torch.cuda.ipc_collect()

    run_name = Path(RUN_DIR).name
    out_dir  = PROJECT_ROOT / "output" / "eval" / "cpt" / run_name
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path = out_dir / "loss.json"
    out_path.write_text(json.dumps({
        "run_dir":    RUN_DIR,
        "valid_fp":   VALID_FP,
        "base_model": BASE_MODEL,
        "results":    results,
    }, indent=2))

    print(f"\nWrote {out_path}")
    print("\nSummary (mean loss per checkpoint):")
    for r in results:
        print(f"  {r['checkpoint']:20s}  loss={r['mean_loss']:.4f}")
