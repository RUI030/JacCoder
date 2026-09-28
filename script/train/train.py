"""CLI entry point for recipe-driven training.

    python script/train/train.py --recipe script/train/recipe/base_sft_v1.yaml
    python script/train/train.py --resume output/adapter/<run>/checkpoint-N

The recipe declares stage + hyperparameters + dataset mix. This script reads
the recipe, builds the mixed HF dataset via mixer.build_from_recipe(), and
dispatches to run_cpt or run_sft. Each run keeps a copy of its recipe as
<out_dir>/recipe.<ext>, so --resume alone rebuilds the same run.

For single-dataset runs, use cpt.py / sft.py directly with their own CLI.
"""
import argparse
import filecmp
import shutil
import sys
from datetime import datetime
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from mixer import build_from_recipe   # noqa: E402
from utils import finalize_out_dir    # noqa: E402


RECIPE_SUFFIXES = (".yaml", ".yml", ".py")


def saved_recipe(run_dir: Path) -> Path | None:
    """The recipe copy train.py left in a run dir, if any."""
    return next((run_dir / f"recipe{s}" for s in RECIPE_SUFFIXES
                 if (run_dir / f"recipe{s}").is_file()), None)


def save_recipe(recipe: Path, out_dir: Path) -> None:
    """Copy the recipe into the run dir; an override on resume is kept beside the original."""
    out_dir.mkdir(parents=True, exist_ok=True)
    kept = saved_recipe(out_dir)
    if kept is None:
        shutil.copyfile(recipe, out_dir / f"recipe{recipe.suffix}")
    elif not filecmp.cmp(recipe, kept, shallow=False):
        stamp = datetime.now().strftime("%m-%d_%H-%M")
        dest  = out_dir / f"recipe.{stamp}{recipe.suffix}"
        shutil.copyfile(recipe, dest)
        print(f"[train] recipe differs from {kept.name}; this run's copy → {dest.name}")


def main() -> None:
    cli = argparse.ArgumentParser(description="Recipe-driven training entry point.")
    cli.add_argument("--recipe",
                     help="Path to a recipe (.yaml/.yml or .py with RECIPE dict). "
                          "Optional with --resume: defaults to the run's saved recipe.")
    cli.add_argument("--adapter", "--adapter-path", dest="adapter",
                     help="Override recipe adapter (continue-from checkpoint).")
    cli.add_argument("--resume", dest="resume",
                     help="Resume from <run>/checkpoint-N (weights, LoRA shape, optimizer, step).")
    args = cli.parse_args()
    if args.adapter and args.resume:
        cli.error("--adapter and --resume are mutually exclusive; --resume already "
                  "loads adapter weights + optimizer state.")

    run_dir = Path(args.resume).resolve().parent if args.resume else None
    recipe  = Path(args.recipe) if args.recipe else saved_recipe(run_dir) if run_dir else None
    if recipe is None:
        cli.error("--recipe is required (no --resume, or the run has no saved recipe.*)")

    stage, cfg, train_ds, eval_ds = build_from_recipe(recipe)

    if args.adapter:
        cfg["adapter"] = args.adapter
    if args.resume:
        # The checkpoint supplies weights and LoRA shape (utils.model_source),
        # so a recipe `adapter:` (the previous stage) no longer applies.
        cfg["resume_from"] = args.resume
        cfg["out_dir"]     = str(run_dir)
    finalize_out_dir(cfg)
    save_recipe(recipe, Path(cfg["out_dir"]))

    if stage == "cpt":
        from cpt import run_cpt
        run_cpt(cfg, train_ds, eval_ds)
    elif stage == "sft":
        from sft import run_sft
        run_sft(cfg, train_ds, eval_ds)
    else:
        raise SystemExit(f"Unknown stage in recipe: {stage!r}")


if __name__ == "__main__":
    main()
