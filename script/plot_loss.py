"""Plot training loss of one or more runs, marking dataset boundaries of sequential recipes."""

import argparse, glob, json, sys
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator

sys.path.append(str(Path(__file__).resolve().parent / "train"))
from mixer import load_recipe, resolve_names

# Setting =================================================
SURFACE  = "#fcfcfb"
INK      = "#0b0b0b"
INK_2    = "#52514e"
GRID     = "#e4e3df"
RAW      = "#c3c2b7"      # per-log-step loss, recessive behind the smoothed line
SERIES   = ["#2a78d6", "#eb6834", "#1baf7a"]   # categorical slots 1-3, in --run order
SMOOTH_N = 10             # rolling mean over this many logged points


# Functions ===============================================
def read_loss(run_dir: Path) -> list[tuple[int, float]]:
    """train/loss from every runs/*/ event dir (a resumed run adds one); later dirs win a step."""
    points: dict[int, float] = {}
    for d in sorted(glob.glob(str(run_dir / "runs" / "*"))):
        ea = EventAccumulator(d, size_guidance={"scalars": 0})
        ea.Reload()
        if "train/loss" in ea.Tags()["scalars"]:
            points.update({e.step: e.value for e in ea.Scalars("train/loss")})
    return sorted(points.items())


def boundaries(recipe: dict) -> list[tuple[str, float]]:
    """(dataset label, first step) per entry of a sequential recipe; [] for mixed ones."""
    if (recipe.get("mixing") or {}).get("strategy") != "sequential":
        return []
    stage   = recipe["recipe"]["stage"]
    hp      = recipe.get("hyperparams") or {}
    per_opt = hp.get("batch_size", 1) * hp.get("grad_acc", 1)
    out, rows = [], 0
    for entry in recipe["datasets"]:
        splits = entry.get("split") or entry.get("splits") or ["train"]
        splits = [splits] if isinstance(splits, str) else splits
        for ds_dir in resolve_names(stage, entry.get("task"), entry.get("name") or entry.get("names")):
            n = sum(sum(1 for _ in (ds_dir / f"{s}.jsonl").open())
                    for s in splits if (ds_dir / f"{s}.jsonl").is_file())
            if n:
                name = f"{entry['task']}/{ds_dir.name}" if stage == "sft" else ds_dir.name
                out.append((name, rows / per_opt))
                rows += n * int(entry.get("repeat", 1))
    return out


def smooth(values: list[float], n: int) -> list[float]:
    return [sum(values[max(0, i - n + 1): i + 1]) / (i + 1 - max(0, i - n + 1))
            for i in range(len(values))]


def draw(runs: list[tuple[str, list[tuple[int, float]], list[tuple[str, float]]]],
         title: str, out: Path) -> None:
    fig, axes = plt.subplots(len(runs), 1, figsize=(12, 3.4 * len(runs) + 0.8),
                             sharey=True, squeeze=False)
    fig.patch.set_facecolor(SURFACE)
    for ax, (label, pts, bounds), color in zip(axes[:, 0], runs, SERIES):
        steps, loss = [s for s, _ in pts], [v for _, v in pts]
        ax.set_facecolor(SURFACE)
        ax.plot(steps, loss, color=RAW, linewidth=1)
        ax.plot(steps, smooth(loss, SMOOTH_N), color=color, linewidth=2)
        for name, start in bounds:
            ax.axvline(start, color=INK_2, linewidth=0.8, linestyle=(0, (3, 3)))
            ax.text(start, 1.0, f" {name}", rotation=90, va="top", ha="left", fontsize=7.5,
                    color=INK_2, transform=ax.get_xaxis_transform())
        ax.set_title(f"{label}  —  final smoothed loss {smooth(loss, SMOOTH_N)[-1]:.3f}",
                     fontsize=10, color=INK, loc="left")
        ax.set_xlim(0, steps[-1])
        ax.set_ylabel("train loss", fontsize=9, color=INK_2)
        ax.grid(True, color=GRID, linewidth=0.8)
        ax.set_axisbelow(True)
        for side in ("top", "right"):
            ax.spines[side].set_visible(False)
    axes[-1, 0].set_xlabel(f"optimizer step   (grey: logged loss, colour: {SMOOTH_N}-point mean;"
                           "   dashed: dataset starts)", fontsize=9, color=INK_2)
    fig.suptitle(title, fontsize=12, color=INK)
    plt.tight_layout()
    out.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(out, dpi=150, bbox_inches="tight", facecolor=SURFACE)
    print(f"wrote {out}")


# Run =====================================================
def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--run", action="append", required=True, metavar="LABEL=RUN_DIR[@RECIPE]",
                    help="training run dir (repeatable, up to 3). The recipe defaults to "
                         "RUN_DIR/recipe.*; pass @RECIPE for runs that predate that copy")
    ap.add_argument("--title", default="Training loss")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    if len(args.run) > len(SERIES):
        ap.error(f"at most {len(SERIES)} runs")

    runs = []
    for spec in args.run:
        label, sep, rest = spec.partition("=")
        if not sep:
            ap.error(f"--run expects LABEL=RUN_DIR[@RECIPE], got {spec!r}")
        run_dir, _, recipe_fp = rest.partition("@")
        run_dir = Path(run_dir)
        recipe_fp = recipe_fp or next(iter(sorted(run_dir.glob("recipe.*"))), None)
        bounds = boundaries(load_recipe(recipe_fp)) if recipe_fp else []
        pts = read_loss(run_dir)
        if not pts:
            ap.error(f"no train/loss events under {run_dir}/runs")
        runs.append((label, pts, bounds))
        print(json.dumps({"run": label, "points": len(pts), "last_step": pts[-1][0],
                          "datasets": len(bounds)}))
    draw(runs, args.title, args.out)


if __name__ == "__main__":
    main()
