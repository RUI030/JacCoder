"""Render a testcase pass-rate distribution chart from a grader run.

Bins each problem into one of nine buckets:
  Tool error (jac)   ← categorized as jac_bytecode_bug/jac_native_limit/jac_infra
  Compile fail       ← no per_test data (check_fail / extract_fail, never ran tests)
  0% / 1-20% / 21-40% / 41-60% / 61-80% / 81-99% / 100% AC
                     ← by fraction of hidden tests that passed

Reads results.jsonl (has `per_test`) and taxonomy.jsonl (has model / jac
attribution). Writes a PNG.

A second PNG (`--cdf-out`, default `<out>_cdf.png`) holds the cumulative
share of problems passing at least x% of their tests, x running 100 -> 0, one
panel per task (compile fail and tool error count as 0%). The left end is the
100% AC share and higher is better. `--compare LABEL=results.jsonl`
(repeatable) overlays other runs on it, e.g. an A/B ablation.

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


# Categorical slots 1-3 of the dataviz reference palette (validated, light mode):
# the run itself, then each --compare run in order.
CDF_COLORS = ["#2a78d6", "#eb6834", "#1baf7a"]


def problem_pass_rate(result_row: dict) -> float:
    """Share of a problem's hidden tests that passed; 0 when none ran."""
    per_test = result_row.get("per_test") or []
    if not per_test:
        return 0.0
    return 100.0 * sum(1 for t in per_test if t.get("passed")) / len(per_test)


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


def draw_cdf(ax, curves: list[tuple[str, list[dict]]], show_ylabel: bool):
    """Share of problems passing >= x% of tests, x from 100 down to 0; higher is better."""
    for (label, rs), color in zip(curves, CDF_COLORS):
        rates = sorted((problem_pass_rate(r) for r in rs), reverse=True)
        n     = len(rates)
        xs    = [100.0] + rates + [0.0]
        ys    = [0.0] + [(i + 1) / n for i in range(n)] + [1.0]
        ac      = sum(1 for r in rates if r == 100) / n
        nonzero = sum(1 for r in rates if r > 0) / n
        ax.step(xs, ys, where="post", color=color, linewidth=2,
                label=f"{label}   {100 * ac:.0f}% AC   ·   {100 * nonzero:.0f}% pass any test")
    ax.set_xlim(100, 0)
    ax.set_ylim(0, 1.02)
    ax.set_xlabel("passes at least x% of its tests\ncompile fail / tool error = 0",
                  fontsize=9, color="#52514e")
    if show_ylabel:
        ax.set_ylabel("cumulative share\nof problems", fontsize=10)
    ax.yaxis.set_major_formatter(lambda v, _: f"{100 * v:.0f}%")
    ax.set_axisbelow(True)
    ax.grid(True, alpha=0.3)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.legend(loc="lower right", fontsize=8, frameon=False)


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
    ap.add_argument("--cdf-out", type=Path, default=None,
                    help="CDF chart PNG path (default: <out stem>_cdf.png)")
    ap.add_argument("--label", default="this run",
                    help="legend name for --results in the CDF panel")
    ap.add_argument("--compare", action="append", default=[], metavar="LABEL=RESULTS",
                    help="another run's results.jsonl to overlay on the CDF "
                         "(repeatable, up to 2)")
    ap.add_argument("--public", type=Path, default=None,
                    help="optional public/<split>.jsonl for canonical task "
                         "mapping; falls back to id-prefix inference")
    args = ap.parse_args()

    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    if len(args.compare) > len(CDF_COLORS) - 1:
        ap.error(f"--compare takes at most {len(CDF_COLORS) - 1} runs")
    compares = []
    for spec in args.compare:
        label, sep, path = spec.partition("=")
        if not sep:
            ap.error(f"--compare expects LABEL=RESULTS, got {spec!r}")
        compares.append((label, [json.loads(l) for l in Path(path).open()]))

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

    def in_task(rs: list[dict], task: str) -> list[dict]:
        return rs if task == "overall" else [
            r for r in rs if (task_of.get(r["problem_id"])
                              or infer_task(r["problem_id"]) or "unknown") == task]

    if not do_split or len(tasks_present) <= 1:
        panels = [("overall", results)]
    else:
        panels = [(t, task_groups[t]) for t in tasks_present]
        panels.append(("overall", results))
    n = len(panels)

    fig, axes = plt.subplots(n, 1, figsize=(11, 5.5 if n == 1 else 4.2 * n))
    axes = [axes] if n == 1 else axes
    for ax, (label, rs) in zip(axes, panels):
        c = counts_for(rs, tax_cat)
        ymax = max(c.values()) * (1.15 if n == 1 else 1.18) or 1
        title = "overall" if n == 1 else f"{label} (n={sum(c.values())})"
        draw_panel(ax, c, rs, title, ymax, show_ylabel=True)
    fig.suptitle(full_title, fontsize=12, y=0.995)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout(rect=(0, 0.02, 1, 0.97), h_pad=3.0)
    plt.savefig(args.out, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {args.out}")

    cdf_out = args.cdf_out or args.out.with_name(f"{args.out.stem}_cdf{args.out.suffix}")
    # Side by side on a shared y-axis, so the curves' heights compare across tasks.
    fig, axes = plt.subplots(1, n, figsize=(5.6 * n, 5.6), sharey=True)
    axes = [axes] if n == 1 else axes
    for i, (ax, (label, rs)) in enumerate(zip(axes, panels)):
        curves = [(args.label, rs)] + [(cl, in_task(crs, label)) for cl, crs in compares]
        draw_cdf(ax, curves, show_ylabel=i == 0)
        ax.set_title(label if n == 1 else f"{label} (n={len(rs)})", fontsize=11, pad=8)
    fig.suptitle(full_title + "\nshare of problems passing at least x% of their tests "
                 "(higher is better)", fontsize=12, y=0.995)
    plt.tight_layout(rect=(0, 0.02, 1, 0.93), w_pad=2.0)
    plt.savefig(cdf_out, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {cdf_out}")

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
