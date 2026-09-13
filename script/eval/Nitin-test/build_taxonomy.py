"""Categorize each failed sample from a grader results.jsonl into a
failure taxonomy. Writes:
  - taxonomy.jsonl : one row per failure with category + evidence
  - taxonomy_counts.json : aggregate counts per category
"""

import argparse
import json
import re
from collections import Counter
from pathlib import Path

# ---------------------------------------------------------------- categories
JAC_BYTECODE_BUG = "jac_bytecode_bug"       # E5043 Store/Load context
JAC_NATIVE_LIMIT = "jac_native_limit"       # E5xxx native lowering limits
JAC_INFRA        = "jac_infra"              # embedded pg / pg_ctl
MODEL_CHECK      = "model_check_fail"       # E1xxx: type / return-path / op
MODEL_SEMANTIC   = "model_semantic"         # test_fail with no jac-bug marker
MODEL_EXTRACT    = "model_extract_fail"     # unclosed fence, no jac block
UNKNOWN          = "unknown"

E_RE = re.compile(r"error\[(?P<code>E\d+)\]:\s*(?P<msg>.+)")


def find_e_codes(err: str) -> list[tuple[str, str]]:
    return [(m.group("code"), m.group("msg")) for m in E_RE.finditer(err or "")]


def categorize(row: dict) -> tuple[str, str]:
    """Return (category, one-line reason)."""
    status = row.get("status")
    err = (row.get("error") or "").strip()

    if status == "pass":
        return "pass", ""

    if status == "extract_fail":
        return MODEL_EXTRACT, "model output missing a proper ```jac block"

    if status == "infra_error":
        if "pg_ctl" in err or "postgres" in err or "pgembed" in err:
            return JAC_INFRA, "embedded postgres startup failure"
        return JAC_INFRA, "grader-side infra_error"

    codes = find_e_codes(err)
    # jac compiler / native-pathway bugs — same code hits reference solutions
    if any(c == "E5043" for c, _ in codes):
        return JAC_BYTECODE_BUG, "jac E5043: Bytecode Store vs Load context (fires on valid code)"
    if any(c in ("E5090", "E5092", "E5020", "E5070", "E5091") for c, _ in codes):
        c, m = next((cm for cm in codes if cm[0].startswith("E5")))
        return JAC_NATIVE_LIMIT, f"jac {c}: {m}"

    # model bugs at check stage
    if status == "check_fail":
        if codes:
            c, m = codes[0]
            return MODEL_CHECK, f"jac {c}: {m}"
        return MODEL_CHECK, "compile failed with no E-code"

    # timeout w/ jac bug already caught above; remaining timeout is real
    if status == "timeout":
        return MODEL_SEMANTIC, "test wall-clock timeout (likely infinite loop in model code)"

    if status == "test_fail":
        # unresolved E-codes on a test_fail — still jac side
        if codes:
            c, m = codes[0]
            if c.startswith("E5"):
                return JAC_NATIVE_LIMIT, f"jac {c}: {m}"
            if c == "E1053":
                return MODEL_SEMANTIC, "model function rejects test input type (None passed)"
            return MODEL_SEMANTIC, f"model bug surfaced as jac {c}: {m}"
        return MODEL_SEMANTIC, "hidden test assertion failed"

    return UNKNOWN, f"status={status}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--results",  type=Path, required=True,
                    help="grader results.jsonl (merged output of grade_stream.py)")
    ap.add_argument("--samples",  type=Path, required=True,
                    help="run's samples.jsonl (for model completion evidence)")
    ap.add_argument("--problems", type=Path, required=True,
                    help="private-split jsonl (for prefix + reference evidence)")
    ap.add_argument("--out-dir",  type=Path, required=True)
    args = ap.parse_args()

    args.out_dir.mkdir(parents=True, exist_ok=True)

    samples = {json.loads(l)["problem_id"]: json.loads(l) for l in open(args.samples)}
    problems = {json.loads(l)["id"]: json.loads(l) for l in open(args.problems)}
    results = [json.loads(l) for l in open(args.results)]

    rows = []
    counts = Counter()
    for r in results:
        cat, reason = categorize(r)
        counts[cat] += 1
        if cat == "pass":
            continue
        pid = r["problem_id"]
        p = problems.get(pid, {})
        s = samples.get(pid, {})
        rows.append({
            "problem_id": pid,
            "status":     r.get("status"),
            "category":   cat,
            "reason":     reason,
            "error_head": (r.get("error") or "").strip()[:400],
            "prefix":     p.get("prefix", ""),
            "completion": s.get("completion", ""),
            "reference":  p.get("reference_completion", ""),
        })

    tax_fp = args.out_dir / "taxonomy.jsonl"
    with tax_fp.open("w") as f:
        for r in rows:
            json.dump(r, f, ensure_ascii=False)
            f.write("\n")

    counts_fp = args.out_dir / "taxonomy_counts.json"
    total = sum(counts.values())
    passed = counts.get("pass", 0)
    fair_denom = total - counts.get(JAC_BYTECODE_BUG, 0) \
                       - counts.get(JAC_NATIVE_LIMIT, 0) \
                       - counts.get(JAC_INFRA, 0)
    summary = {
        "total":            total,
        "counts":           dict(counts),
        "raw_pass_rate":    passed / total if total else 0.0,
        "fair_denom":       fair_denom,
        "fair_pass_rate":   passed / fair_denom if fair_denom else 0.0,
        "notes":            [
            "raw_pass_rate = passed / all graded samples",
            "fair_pass_rate = passed / (all - jac_bytecode_bug - jac_native_limit - jac_infra); "
            "those 3 categories bit the reference too and aren't the model's fault",
        ],
    }
    counts_fp.write_text(json.dumps(summary, indent=2) + "\n")

    print(f"wrote {tax_fp}  ({len(rows)} failure rows)")
    print(f"wrote {counts_fp}")
    print()
    print(f"total graded : {total}")
    print(f"pass         : {passed}")
    for k, v in counts.most_common():
        if k == "pass": continue
        print(f"  {k:25s} {v}")
    print(f"\nraw  pass@1 : {100 * summary['raw_pass_rate']:.1f}%  ({passed}/{total})")
    print(f"fair pass@1 : {100 * summary['fair_pass_rate']:.1f}%  ({passed}/{fair_denom}) "
          f"— excluding jac toolchain bugs")


if __name__ == "__main__":
    main()
