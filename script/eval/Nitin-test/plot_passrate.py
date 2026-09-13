"""Render a testcase pass-rate distribution chart from a grader run.

Bins each problem into one of nine buckets:
  Tool error (jac)   ← categorized as jac_bytecode_bug/jac_native_limit/jac_infra
  Compile fail       ← no per_test data (check_fail / extract_fail, never ran tests)
  0% / 1-20% / 21-40% / 41-60% / 61-80% / 81-99% / 100% AC
                     ← by fraction of hidden tests that passed

Reads results.jsonl (has `per_test`) and taxonomy.jsonl (has model / jac
attribution). Writes a PNG.
"""

import argparse
import json
from pathlib import Path


JAC_CATS = {"jac_bytecode_bug", "jac_native_limit", "jac_infra"}


BUCKET_ORDER = [
    "Tool error\n(jac bug)",
    "Compile fail\n(model)",
    "0%\n(all wrong)",
    "1-20%",
    "21-40%",
    "41-60%",
    "61-80%",
    "81-99%",
    "100% AC",
]

# grey (tool) → red (compile fail) → red→green gradient across pass-rate buckets
COLORS = [
    "#8a8a8a", "#b34747",
    "#d13a3a", "#e07b3a", "#e0a83a", "#c5c033",
    "#8db63f", "#4fa04a", "#2f7d31",
]


def bucket_row(result_row: dict, category: str | None) -> str:
    """Prefer the current result_row's per_test as the source of truth; fall
    back to `category` (from taxonomy) only when there's no per_test — the
    taxonomy may be stale relative to a fresher results.jsonl."""
    per_test = result_row.get("per_test") or []
    if per_test:
        passed = sum(1 for t in per_test if t.get("passed"))
        rate = 100.0 * passed / len(per_test)
        if rate == 0:      return "0%\n(all wrong)"
        if rate == 100:    return "100% AC"
        if rate <= 20:     return "1-20%"
        if rate <= 40:     return "21-40%"
        if rate <= 60:     return "41-60%"
        if rate <= 80:     return "61-80%"
        return "81-99%"
    if category in JAC_CATS:
        return "Tool error\n(jac bug)"
    return "Compile fail\n(model)"


def testcase_pass_rate(results: list[dict]) -> float | None:
    total = passed = 0
    for r in results:
        pt = r.get("per_test") or []
        total += len(pt)
        passed += sum(1 for t in pt if t.get("passed"))
    return (100.0 * passed / total) if total else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--results",  type=Path, required=True,
                    help="grade_stream.py merged results.jsonl (with per_test)")
    ap.add_argument("--taxonomy", type=Path, required=True,
                    help="build_taxonomy.py output taxonomy.jsonl")
    ap.add_argument("--out",      type=Path, required=True,
                    help="output PNG path")
    ap.add_argument("--title",    default="Testcase pass-rate distribution",
                    help="chart title (a subtitle line follows automatically)")
    ap.add_argument("--subtitle", default="",
                    help="second line under title; empty to omit")
    args = ap.parse_args()

    # matplotlib import is lazy so `--help` works without it installed
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    results = [json.loads(l) for l in args.results.open()]
    tax_cat = {r["problem_id"]: r["category"]
               for r in (json.loads(l) for l in args.taxonomy.open())}

    counts = {name: 0 for name in BUCKET_ORDER}
    for r in results:
        counts[bucket_row(r, tax_cat.get(r["problem_id"]))] += 1

    total = sum(counts.values())
    ac    = counts["100% AC"]
    partial = sum(counts[k] for k in
                  ("1-20%", "21-40%", "41-60%", "61-80%", "81-99%"))
    tc_rate = testcase_pass_rate(results)

    fig, ax = plt.subplots(figsize=(11, 5.5))
    bars = ax.bar(range(len(BUCKET_ORDER)),
                  [counts[k] for k in BUCKET_ORDER],
                  color=COLORS, edgecolor="#333", linewidth=0.6)
    ax.set_xticks(range(len(BUCKET_ORDER)))
    ax.set_xticklabels(BUCKET_ORDER, fontsize=10)
    ax.set_ylabel("# of problems", fontsize=11)
    title = args.title
    if args.subtitle:
        title = f"{title}\n{args.subtitle}"
    ax.set_title(title, fontsize=12, pad=12)
    ax.set_axisbelow(True)
    ax.yaxis.grid(True, alpha=0.3)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    for bar, name in zip(bars, BUCKET_ORDER):
        ax.text(bar.get_x() + bar.get_width() / 2, counts[name] + 0.8,
                str(counts[name]),
                ha="center", va="bottom", fontsize=10, fontweight="bold")

    footer = (f"AC = {ac}/{total} ({100 * ac / total:.1f}%)   |   "
              f"partial credit = {partial} problems")
    if tc_rate is not None:
        footer += f"   |   testcase pass rate = {tc_rate:.1f}%"
    ax.text(0.99, -0.20, footer, ha="right", va="top",
            transform=ax.transAxes, fontsize=10, color="#555")

    args.out.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout()
    plt.savefig(args.out, dpi=150, bbox_inches="tight")
    print(f"wrote {args.out}")
    print(f"AC={ac}/{total} ({100 * ac / total:.1f}%) | partial={partial} | "
          f"testcase_pass_rate={tc_rate:.1f}%" if tc_rate is not None else "")


if __name__ == "__main__":
    main()
