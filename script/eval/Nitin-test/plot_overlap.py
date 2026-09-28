"""Pass/fail overlap of two grader runs on the same problems, per task, with exact McNemar.

For every problem both runs graded, a problem falls in one of four groups:
both pass, only A passes, only B passes, both fail. The chart draws one
stacked bar per task (completion, translation, overall); the text report
also lists the problem ids that flip, for spot checks.

    python script/eval/Nitin-test/plot_overlap.py \
      --a out/v13A_test_*/results.jsonl --label-a v1.3-A \
      --b out/v13B_test_*/results.jsonl --label-b v1.3-B \
      --out out/v13_ab/overlap.png
"""

import argparse
import json
from math import comb
from pathlib import Path


# Setting =================================================
# A/B take categorical slots 1-2 (same as plot_passrate's CDF); the two
# agreement groups are neutral greys so the eye goes to the disagreements.
GROUPS = [
    ("both pass", "#d3d2cb"),
    ("only A",    "#2a78d6"),
    ("only B",    "#eb6834"),
    ("both fail", "#52514e"),
]
TASK_PREFIX = {"completion": "fn-complete-", "translation": "fn-translate-"}


# Functions ===============================================
def load(fp: Path) -> dict[str, bool]:
    """problem_id -> passed (grader status == pass)."""
    return {r["problem_id"]: r["status"] == "pass"
            for r in map(json.loads, fp.open())}


def mcnemar_exact(only_a: int, only_b: int) -> float:
    """Two-sided exact McNemar p-value on the discordant pairs."""
    n = only_a + only_b
    if n == 0:
        return 1.0
    k = min(only_a, only_b)
    return min(1.0, 2 * sum(comb(n, i) for i in range(k + 1)) / 2 ** n)


def fail_overlap(groups: dict[str, list[str]]) -> float:
    """Jaccard of the two failure sets: both fail / failed by either."""
    either = len(groups["both fail"]) + len(groups["only A"]) + len(groups["only B"])
    return len(groups["both fail"]) / either if either else 1.0


def overlap(a: dict[str, bool], b: dict[str, bool], ids: list[str]) -> dict[str, list[str]]:
    groups = {name: [] for name, _ in GROUPS}
    for pid in ids:
        key = {(True, True): "both pass", (True, False): "only A",
               (False, True): "only B", (False, False): "both fail"}[(a[pid], b[pid])]
        groups[key].append(pid)
    return groups


def draw(rows: list[tuple[str, dict[str, list[str]]]], label_a: str, label_b: str,
         title: str, out: Path) -> None:
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    names = {"only A": f"only {label_a} passes", "only B": f"only {label_b} passes",
             "both pass": "both pass", "both fail": "both fail"}
    fig, ax = plt.subplots(figsize=(11, 1.1 * len(rows) + 1.8))
    for y, (task, groups) in enumerate(reversed(rows)):
        total = sum(len(v) for v in groups.values())
        left = 0.0
        for name, color in GROUPS:
            share = len(groups[name]) / total
            # 2px surface gap between segments: white edge on each fill.
            ax.barh(y, share, left=left, color=color, edgecolor="#fcfcfb",
                    linewidth=2, height=0.62, label=names[name] if y == 0 else None)
            if share >= 0.035:
                ink = "#ffffff" if name in ("only A", "only B", "both fail") else "#0b0b0b"
                ax.text(left + share / 2, y, str(len(groups[name])), ha="center",
                        va="center", fontsize=9, fontweight="bold", color=ink)
            left += share
        p = mcnemar_exact(len(groups["only A"]), len(groups["only B"]))
        ax.text(1.01, y, f"n={total}  p={p:.2f}\nfail overlap {100 * fail_overlap(groups):.0f}%",
                va="center", fontsize=8.5,
                color="#52514e", transform=ax.get_yaxis_transform())
    ax.set_yticks(range(len(rows)))
    ax.set_yticklabels([t for t, _ in reversed(rows)], fontsize=10)
    ax.set_xlim(0, 1)
    ax.xaxis.set_major_formatter(lambda v, _: f"{100 * v:.0f}%")
    ax.set_xlabel("share of problems   ·   p: exact McNemar on the 'only' groups   ·   "
                  "fail overlap: both fail / failed by either",
                  fontsize=9, color="#52514e")
    for side in ("top", "right", "left"):
        ax.spines[side].set_visible(False)
    ax.tick_params(axis="y", length=0)
    ax.legend(loc="upper center", bbox_to_anchor=(0.5, -0.32 if len(rows) < 3 else -0.22),
              ncol=4, fontsize=9, frameon=False)
    fig.suptitle(title, fontsize=12)
    out.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout()
    plt.savefig(out, dpi=150, bbox_inches="tight")
    print(f"wrote {out}")


# Run =====================================================
def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--a", type=Path, required=True, help="run A results.jsonl")
    ap.add_argument("--b", type=Path, required=True, help="run B results.jsonl")
    ap.add_argument("--label-a", default="A")
    ap.add_argument("--label-b", default="B")
    ap.add_argument("--out", type=Path, required=True, help="output PNG; ids go to <out>.json")
    ap.add_argument("--title", default=None)
    args = ap.parse_args()

    a, b = load(args.a), load(args.b)
    common = sorted(set(a) & set(b))
    if len(common) < max(len(a), len(b)):
        print(f"[overlap] comparing {len(common)} shared problems "
              f"(A has {len(a)}, B has {len(b)})")

    rows = []
    for task, prefix in TASK_PREFIX.items():
        ids = [p for p in common if p.startswith(prefix)]
        if ids:
            rows.append((task, overlap(a, b, ids)))
    rows.append(("overall", overlap(a, b, common)))

    for task, groups in rows:
        counts = {k: len(v) for k, v in groups.items()}
        p = mcnemar_exact(counts["only A"], counts["only B"])
        print(f"{task:12s} {counts}  McNemar p={p:.3f}  "
              f"fail overlap={100 * fail_overlap(groups):.1f}%")

    title = args.title or f"Pass/fail overlap: {args.label_a} vs {args.label_b}"
    draw(rows, args.label_a, args.label_b, title, args.out)
    ids_fp = args.out.with_suffix(".json")
    ids_fp.write_text(json.dumps({t: g for t, g in rows}, indent=1) + "\n", encoding="utf-8")
    print(f"wrote {ids_fp}")


if __name__ == "__main__":
    main()
