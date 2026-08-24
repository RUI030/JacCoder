import json, sys
from collections import defaultdict
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.jac_block import first_jac_block
from utils.jac_cli import check as jac_check

# Setting =================================================
PRED_FILE     = ""  # e.g. output/eval/code_completion/<ds>/<tag>/predictions.jsonl
CHECK_TIMEOUT = 30  # seconds per file


# Functions ===============================================
def evaluate(pred_file=PRED_FILE):
    """Score every prediction: has_block, check_pass. Group by meta.class."""
    if not pred_file:
        raise ValueError("PRED_FILE must be set")
    pred_path = Path(pred_file)
    if not pred_path.is_file():
        raise FileNotFoundError(f"Predictions not found: {pred_path}")

    overall = {"n": 0, "has_block": 0, "check_pass": 0}
    by_class: dict[str, dict[str, int]] = defaultdict(
        lambda: {"n": 0, "has_block": 0, "check_pass": 0}
    )
    failures: list[dict] = []

    with pred_path.open("r", encoding="utf-8") as src:
        for line in src:
            rec = json.loads(line)
            cls = rec.get("meta", {}).get("class", "unknown")
            overall["n"] += 1
            by_class[cls]["n"] += 1

            block = first_jac_block(rec["prediction"])
            if block is None:
                failures.append({"id": rec["id"], "class": cls, "reason": "no_block"})
                continue
            overall["has_block"] += 1
            by_class[cls]["has_block"] += 1

            ok, err = jac_check(block, timeout=CHECK_TIMEOUT)
            if ok:
                overall["check_pass"] += 1
                by_class[cls]["check_pass"] += 1
            else:
                failures.append(
                    {"id": rec["id"], "class": cls, "reason": "check_fail", "err": err[:500]}
                )

    report = {
        "pred_file": str(pred_path),
        "overall": overall,
        "by_class": dict(by_class),
        "failures": failures,
    }
    out_path = pred_path.parent / "report.json"
    with out_path.open("w", encoding="utf-8") as dst:
        json.dump(report, dst, indent=2, ensure_ascii=False)

    n = overall["n"] or 1
    print(f"n={overall['n']}  has_block={overall['has_block']}/{n}  "
          f"check_pass={overall['check_pass']}/{n}")
    for cls, s in by_class.items():
        cn = s["n"] or 1
        print(f"  {cls:10s} n={s['n']:4d}  block={s['has_block']:4d}  "
              f"pass={s['check_pass']:4d}  ({s['check_pass']*100/cn:.1f}%)")
    print(f"Report: {out_path}")


# Run =====================================================
if __name__ == "__main__":
    evaluate()
