"""Single-adapter multi-task eval driver.

Loads the model ONCE, then iterates over EVAL_SET running infer + gate on
each (task, ds) pair. Avoids the ~2 min re-load cost that a bash sweep
would pay per task.
"""

import sys
from datetime import datetime
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.model import load_model

from infer import generate_predictions, MAX_SEQ_LENGTH, LOAD_IN_4BIT, BASE_MODEL
from gate  import evaluate as gate_evaluate

# Setting =================================================
ADAPTER_PATH = ""   # empty => base model only
LIMIT        = 30   # 0 => all valid records
METRICS      = ["check"]              # ladder: e.g. ["check", "run"]

EVAL_SET = [
    ("code_completion", "Nitin-10k-jac-functions"),
    ("code_gen",        "opus-synth-v2"),
    ("py2jac",          "opus-synth-v2"),
    ("js2jac",          "Nitin-js2jac"),
]

SPLIT = "valid"

# CLI overrides ============================================
import argparse
cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--adapter", dest="adapter")
cli.add_argument("--limit",   dest="limit",   type=int)
cli.add_argument("--checks",  dest="checks",  help="comma list, e.g. check,run")
args, _ = cli.parse_known_args()
if args.adapter is not None: ADAPTER_PATH = args.adapter
if args.limit   is not None: LIMIT        = args.limit
if args.checks:              METRICS      = [c.strip() for c in args.checks.split(",") if c.strip()]

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent
TAG   = Path(ADAPTER_PATH).parent.name if ADAPTER_PATH else BASE_MODEL.replace("/", "_")
STAMP = datetime.now().strftime("%m-%d_%H-%M")


# Run =====================================================
if __name__ == "__main__":
    print(f"Adapter : {ADAPTER_PATH or '<base>'}")
    print(f"Limit   : {LIMIT}")
    print(f"Metrics : {METRICS}")
    print(f"Tasks   : {[t for t, _ in EVAL_SET]}\n")

    model, tokenizer = load_model(
        ADAPTER_PATH or BASE_MODEL, MAX_SEQ_LENGTH, LOAD_IN_4BIT,
    )

    reports = []
    for task, ds in EVAL_SET:
        in_file  = PROJECT_ROOT / "dataset" / "sft" / task / ds / f"{SPLIT}.jsonl"
        out_dir  = PROJECT_ROOT / "output" / "eval" / task / ds / f"{TAG}_{STAMP}"
        pred_fp  = out_dir / "predictions.jsonl"

        print(f"\n============================")
        print(f" INFER  {task} / {ds}")
        print(f"============================")
        generate_predictions(model, tokenizer, str(in_file), str(pred_fp), LIMIT)

        print(f"\n============================")
        print(f" GATE   {task} / {ds}")
        print(f"============================")
        gate_evaluate(str(pred_fp), METRICS)
        reports.append(out_dir / "report.json")

    print("\nReports:")
    for r in reports:
        print(f"  {r}")
