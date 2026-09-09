"""CLI entry point for recipe-driven training.

    python script/train/train.py --recipe script/train/recipe/base_sft_v1.yaml

The recipe declares stage + hyperparameters + dataset mix. This script reads
the recipe, builds the mixed HF dataset via mixer.build_from_recipe(), and
dispatches to run_cpt or run_sft.

For single-dataset runs, use cpt.py / sft.py directly with their own CLI.
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from mixer import build_from_recipe   # noqa: E402


def main() -> None:
    cli = argparse.ArgumentParser(description="Recipe-driven training entry point.")
    cli.add_argument("--recipe", required=True,
                     help="Path to a recipe (.yaml/.yml or .py with RECIPE dict).")
    cli.add_argument("--adapter", "--adapter-path", dest="adapter",
                     help="Override recipe adapter (continue-from checkpoint).")
    cli.add_argument("--resume", dest="resume",
                     help="Override recipe resume-from-checkpoint dir.")
    args = cli.parse_args()

    stage, cfg, train_ds, eval_ds = build_from_recipe(args.recipe)

    if args.adapter:
        cfg["adapter"] = args.adapter
    if args.resume:
        cfg["resume_from"] = args.resume
    if cfg.get("adapter") and cfg.get("resume_from"):
        raise SystemExit(
            "--adapter and --resume are mutually exclusive; --resume already "
            "loads adapter weights + optimizer state."
        )

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
