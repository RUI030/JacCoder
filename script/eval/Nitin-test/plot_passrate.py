"""Render a testcase pass-rate distribution chart from a grader run.

Bins each problem into one of nine buckets:
  Tool error (jac)   ← categorized as jac_bytecode_bug/jac_native_limit/jac_infra
  Compile fail       ← no per_test data (check_fail / extract_fail, never ran tests)
  0% / 1-20% / 21-40% / 41-60% / 61-80% / 81-99% / 100% AC
                     ← by fraction of hidden tests that passed

Reads results.jsonl (has `per_test`) and taxonomy.jsonl (has model / jac
attribution). Writes a PNG.

When results span multiple tasks (e.g. completion + translation),
`--split-by-task` renders one subplot per task plus an "overall" panel on a
shared y-axis. Task is read from `--public <split>.jsonl` when given,
otherwise inferred from the problem-id prefix (fn-complete-* / fn-translate-*).
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


def infer_task(problem_id: str) -> str | None:
    if problem_id.startswith("fn-complete-"):
        return "completion"
    if problem_id.startswith("fn-translate-"):
        return "translation"
    return None


def counts_for(results: list[dict], tax_cat: dict) -> dict[str, int]:
    counts = {name: 0 for name in BUCKET_ORDER}
    for r in results:
        counts[bucket_row(r, tax_cat.get(r["problem_id"]))] += 1
    return counts


def draw_panel(ax, counts: dict[str, int], results: list[dict],
               panel_title: str, ymax: int, show_ylabel: bool):
    total = sum(counts.values())
    ac = counts["100% AC"]
    partial = sum(counts[k] for k in
                  ("1-20%", "21-40%", "41-60%", "61-80%", "81-99%"))
    tc_rate = testcase_pass_rate(results)

    bars = ax.bar(range(len(BUCKET_ORDER)),
                  [counts[k] for k in BUCKET_ORDER],
                  color=COLORS, edgecolor="#333", linewidth=0.6)
    ax.set_xticks(range(len(BUCKET_ORDER)))
    ax.set_xticklabels(BUCKET_ORDER, fontsize=9)
    if show_ylabel:
        ax.set_ylabel("# of problems", fontsize=11)
    ax.set_title(panel_title, fontsize=11, pad=8)
    ax.set_axisbelow(True)
    ax.yaxis.grid(True, alpha=0.3)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_ylim(0, ymax)
    for bar, name in zip(bars, BUCKET_ORDER):
        v = counts[name]
        ax.text(bar.get_x() + bar.get_width() / 2, v + ymax * 0.01,
                str(v), ha="center", va="bottom",
                fontsize=9, fontweight="bold")

    footer = (f"AC = {ac}/{total} ({100 * ac / total:.1f}%)   |   "
              f"partial = {partial}")
    if tc_rate is not None:
        footer += f"   |   testcase pass rate = {tc_rate:.1f}%"
    ax.text(0.5, -0.28, footer, ha="center", va="top",
            transform=ax.transAxes, fontsize=9, color="#555")


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
    ap.add_argument("--split-by-task", action="store_true",
                    help="one subplot per task plus overall (auto-on when "
                         "multiple tasks are present)")
    ap.add_argument("--no-split-by-task", dest="split_by_task",
                    action="store_false",
                    help="force single-panel output even with multiple tasks")
    ap.set_defaults(split_by_task=None)
    ap.add_argument("--public", type=Path, default=None,
                    help="optional public/<split>.jsonl for canonical task "
                         "mapping; falls back to id-prefix inference")
    args = ap.parse_args()

    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    results = [json.loads(l) for l in args.results.open()]
    tax_cat = {r["problem_id"]: r["category"]
               for r in (json.loads(l) for l in args.taxonomy.open())}

    task_of: dict[str, str | None] = {}
    if args.public and args.public.exists():
        for line in args.public.open():
            row = json.loads(line)
            task_of[row["id"]] = row.get("task")
    for r in results:
        pid = r["problem_id"]
        task_of.setdefault(pid, infer_task(pid))

    task_groups: dict[str, list[dict]] = {}
    for r in results:
        t = task_of.get(r["problem_id"]) or "unknown"
        task_groups.setdefault(t, []).append(r)

    # Decide layout.
    tasks_present = [t for t in ("completion", "translation")
                     if t in task_groups]
    other_tasks = sorted(t for t in task_groups if t not in tasks_present)
    tasks_present.extend(other_tasks)
    do_split = args.split_by_task
    if do_split is None:
        do_split = len(tasks_present) > 1

    overall_counts = counts_for(results, tax_cat)
    full_title = args.title + (f"\n{args.subtitle}" if args.subtitle else "")

    if not do_split or len(tasks_present) <= 1:
        fig, ax = plt.subplots(figsize=(11, 5.5))
        ymax = max(overall_counts.values()) * 1.15 or 1
        draw_panel(ax, overall_counts, results, "overall", ymax,
                   show_ylabel=True)
        fig.suptitle(full_title, fontsize=12, y=0.995)
    else:
        panels = [(t, task_groups[t]) for t in tasks_present]
        panels.append(("overall", results))
        n = len(panels)
        fig, axes = plt.subplots(n, 1, figsize=(11, 4.2 * n))
        if n == 1:
            axes = [axes]
        panel_counts = [counts_for(rs, tax_cat) for _, rs in panels]
        for i, ((label, rs), c) in enumerate(zip(panels, panel_counts)):
            ymax = max(c.values()) * 1.18 or 1
            draw_panel(axes[i], c, rs,
                       f"{label} (n={sum(c.values())})",
                       ymax, show_ylabel=True)
        fig.suptitle(full_title, fontsize=12, y=0.995)

    args.out.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout(rect=(0, 0.02, 1, 0.97), h_pad=3.0)
    plt.savefig(args.out, dpi=150, bbox_inches="tight")
    print(f"wrote {args.out}")

    ac = overall_counts["100% AC"]
    total = sum(overall_counts.values())
    partial = sum(overall_counts[k] for k in
                  ("1-20%", "21-40%", "41-60%", "61-80%", "81-99%"))
    tc_rate = testcase_pass_rate(results)
    line = f"AC={ac}/{total} ({100 * ac / total:.1f}%) | partial={partial}"
    if tc_rate is not None:
        line += f" | testcase_pass_rate={tc_rate:.1f}%"
    print(line)


if __name__ == "__main__":
    main()
