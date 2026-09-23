"""jac check pass-rate heatmap (task x class) from gate.py report.json files.

Usage:
    python script/eval/compare/heatmap.py --tag sft-gguf-q4km-full \
        --out report/<name>.png [--title "..."]

Picks the newest output/eval/<task>/<ds>/<tag>_<stamp>/report.json per task.
"""

import argparse, glob, json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

PROJECT_ROOT = Path(__file__).resolve().parents[3]

# Setting =================================================
TASK_ORDER  = ["code_completion", "py2jac", "js2jac", "osp", "code_gen"]
CLASS_ORDER = ["function", "graph", "osp", "fullstack"]
SURFACE     = "#fcfcfb"
INK, INK_2  = "#0b0b0b", "#52514e"
EMPTY       = "#efeeea"   # task x class combos with no samples
# Sequential blue ramp, steps 100 -> 700 (light = low pass rate)
RAMP = ["#cde2fb", "#9ec5f4", "#6da7ec", "#3987e5", "#256abf", "#184f95", "#0d366b"]


# Functions ===============================================
def load_reports(tag: str) -> dict[str, dict]:
    """task -> newest report.json for that tag."""
    out = {}
    for fp in sorted(glob.glob(str(PROJECT_ROOT / f"output/eval/*/*/{tag}_*/report.json"))):
        task = Path(fp).parts[-4]
        out[task] = json.load(open(fp))          # sorted by stamp, so newest wins
    return out


def cell_counts(reports: dict[str, dict]):
    """(task, class) -> (passed, n), plus per-task and per-class totals under 'all'."""
    cells = {}
    for task, rep in reports.items():
        for cls, s in rep["by_class"].items():
            cells[(task, cls)] = (s.get("check_pass", 0), s["n"])
        o = rep["overall"]
        cells[(task, "all")] = (o.get("check_pass", 0), o["n"])
    for cls in CLASS_ORDER + ["all"]:
        vals = [v for (t, c), v in cells.items() if c == cls and t != "all"]
        if vals:
            cells[("all", cls)] = (sum(p for p, _ in vals), sum(n for _, n in vals))
    return cells


def plot(cells, tasks: list[str], classes: list[str], title: str, out: str) -> None:
    cmap = LinearSegmentedColormap.from_list("seq_blue", RAMP)
    fig, ax = plt.subplots(figsize=(1.9 * len(classes) + 2.4, 0.85 * len(tasks) + 1.8),
                           facecolor=SURFACE)
    ax.set_facecolor(SURFACE)
    for i, task in enumerate(tasks):
        for j, cls in enumerate(classes):
            total = task == "all" or cls == "all"
            if (task, cls) not in cells:
                ax.add_patch(plt.Rectangle((j, i), 1, 1, color=EMPTY, lw=0))
                ax.text(j + 0.5, i + 0.5, "—", ha="center", va="center", color=INK_2, fontsize=9)
                continue
            p, n = cells[(task, cls)]
            rate = p / n if n else 0.0
            ax.add_patch(plt.Rectangle((j, i), 1, 1, color=cmap(rate), lw=0))
            ink = "#ffffff" if rate >= 0.55 else INK   # keep labels legible on dark steps
            ax.text(j + 0.5, i + 0.44, f"{rate:.0%}", ha="center", va="center", color=ink,
                    fontsize=11, fontweight="bold" if total else "normal")
            ax.text(j + 0.5, i + 0.72, f"{p}/{n}", ha="center", va="center", color=ink, fontsize=7.5)
    # 2px surface gaps between cells, heavier separators before the "all" row/column
    for k in range(len(classes) + 1):
        ax.axvline(k, color=SURFACE, lw=2.5 if k != len(classes) - 1 else 5)
    for k in range(len(tasks) + 1):
        ax.axhline(k, color=SURFACE, lw=2.5 if k != len(tasks) - 1 else 5)
    ax.set_xlim(0, len(classes)); ax.set_ylim(len(tasks), 0)
    ax.set_xticks([j + 0.5 for j in range(len(classes))], classes, color=INK, fontsize=9)
    ax.set_yticks([i + 0.5 for i in range(len(tasks))], tasks, color=INK, fontsize=9)
    ax.xaxis.tick_top()
    ax.tick_params(length=0)
    for side in ax.spines.values():
        side.set_visible(False)
    ax.set_xlabel("class", color=INK_2, fontsize=9, labelpad=8)
    ax.xaxis.set_label_position("top")
    ax.set_ylabel("task", color=INK_2, fontsize=9)
    sm = plt.cm.ScalarMappable(cmap=cmap, norm=plt.Normalize(0, 1))
    cb = fig.colorbar(sm, ax=ax, fraction=0.035, pad=0.03)
    cb.set_ticks([0, 0.25, 0.5, 0.75, 1], labels=["0%", "25%", "50%", "75%", "100%"])
    cb.ax.tick_params(colors=INK_2, labelsize=8, length=0)
    cb.outline.set_visible(False)
    cb.set_label("jac check pass rate", color=INK_2, fontsize=8)
    fig.suptitle(title, color=INK, fontsize=11, x=0.02, ha="left")
    fig.text(0.02, 0.01, "Cell = passed/n samples; — = no samples of that class in the task.",
             color=INK_2, fontsize=7.5)
    fig.tight_layout(rect=(0, 0.03, 1, 0.95))
    fig.savefig(out, dpi=150, facecolor=SURFACE)
    print(f"wrote {out}")


# Run =====================================================
if __name__ == "__main__":
    cli = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    cli.add_argument("--tag", required=True, help="eval output tag, e.g. sft-gguf-q4km-full")
    cli.add_argument("--out", required=True, help="output PNG")
    cli.add_argument("--title", default=None)
    args = cli.parse_args()

    reports = load_reports(args.tag)
    if not reports:
        raise SystemExit(f"no report.json found for tag {args.tag!r}")
    cells = cell_counts(reports)
    tasks = [t for t in TASK_ORDER if t in reports] + sorted(set(reports) - set(TASK_ORDER)) + ["all"]
    classes = [c for c in CLASS_ORDER if any((t, c) in cells for t in tasks)] + ["all"]
    for (t, c), (p, n) in sorted(cells.items()):
        print(f"  {t:16} {c:10} {p:5}/{n:<5} {p / n:6.1%}")
    plot(cells, tasks, classes, args.title or f"jac check pass rate — {args.tag}", args.out)
