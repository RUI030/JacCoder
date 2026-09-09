"""Read a training recipe, resolve dataset paths, build a mixed HF dataset.

A recipe is YAML (.yaml/.yml) or a Python module exporting a `RECIPE` dict.
See `recipe/README.md` for schema details.

The mixer returns (stage, config, train_ds, eval_ds). It never loads models —
that is train.py's job (via run_cpt / run_sft).
"""
from __future__ import annotations

import importlib.util
from pathlib import Path

from datasets import (
    Dataset,
    concatenate_datasets,
    interleave_datasets,
    load_dataset,
)

DATASET_ROOT = Path(__file__).resolve().parent.parent.parent / "dataset"


# Recipe I/O ================================================================
def load_recipe(path: str | Path) -> dict:
    """Parse a recipe file (.yaml/.yml or .py) into a dict."""
    p = Path(path)
    if not p.is_file():
        raise FileNotFoundError(f"Recipe not found: {p}")
    if p.suffix.lower() in {".yaml", ".yml"}:
        import yaml
        return yaml.safe_load(p.read_text(encoding="utf-8"))
    if p.suffix.lower() == ".py":
        spec = importlib.util.spec_from_file_location(p.stem, p)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        if not hasattr(mod, "RECIPE"):
            raise ValueError(f"Python recipe {p} must define RECIPE = {{...}}")
        return mod.RECIPE
    raise ValueError(f"Unsupported recipe format: {p.suffix}")


# Dataset resolution ========================================================
def resolve_names(stage: str, task: str | None, names) -> list[Path]:
    """Return the list of dataset directories a single recipe entry expands to.

    stage: "cpt" or "sft"
    task:  subdir name under sft/ (ignored when stage == "cpt")
    names: str, list[str], "*" or None
    """
    if stage == "cpt":
        base = DATASET_ROOT / "cpt"
    elif stage == "sft":
        if not task:
            raise ValueError("SFT recipe entry requires `task`")
        base = DATASET_ROOT / "sft" / task
    else:
        raise ValueError(f"Unknown stage: {stage}")

    if not base.is_dir():
        raise FileNotFoundError(f"Missing dataset dir: {base}")

    if names in (None, "*", []):
        return sorted(d for d in base.iterdir() if d.is_dir())
    if isinstance(names, str):
        names = [names]
    return [base / n for n in names]


TRAIN_COLUMNS = ("text", "messages")  # columns the trainers consume


def load_splits(ds_dir: Path, splits: list[str]) -> Dataset | None:
    """Load and concatenate the requested splits under one dataset dir.

    Non-training columns (everything except `text` and `messages`) are dropped
    so that mixing across datasets can't fail on mismatched `meta` schemas.
    """
    files = [str(ds_dir / f"{s}.jsonl") for s in splits if (ds_dir / f"{s}.jsonl").is_file()]
    if not files:
        return None
    ds = load_dataset("json", data_files=files, split="train")
    drop = [c for c in ds.column_names if c not in TRAIN_COLUMNS]
    return ds.remove_columns(drop) if drop else ds


def entry_datasets(entry: dict, stage: str, kind: str) -> list[tuple[str, Dataset, float, int]]:
    """Expand one recipe entry into (label, dataset, weight, repeat) tuples.

    kind: "train" or "valid" — picks the split list.
    """
    task   = entry.get("task")
    names  = entry.get("name") or entry.get("names")
    splits = entry.get("split") or entry.get("splits") or ["train"]
    if isinstance(splits, str):
        splits = [splits]
    if kind == "valid":
        splits = ["valid" if s == "train" else s for s in splits]

    weight = float(entry.get("weight", 0)) or 0.0
    repeat = int(entry.get("repeat", 1))

    out: list[tuple[str, Dataset, float, int]] = []
    for ds_dir in resolve_names(stage, task, names):
        ds = load_splits(ds_dir, splits)
        if ds is None or len(ds) == 0:
            continue
        label = f"{task or 'cpt'}/{ds_dir.name}"
        out.append((label, ds, weight, repeat))
    return out


# Mixing ====================================================================
def mix(items: list[tuple[str, Dataset, float, int]], mixing: dict, seed: int) -> Dataset | None:
    if not items:
        return None
    strategy = (mixing.get("strategy") or "concat").lower()

    if strategy == "concat":
        parts = []
        for _, ds, _, repeat in items:
            for _ in range(max(1, repeat)):
                parts.append(ds)
        return concatenate_datasets(parts).shuffle(seed=seed)

    if strategy == "interleave":
        datasets = [ds for _, ds, _, _ in items]
        weights  = [w for _, _, w, _ in items]
        if any(w <= 0 for w in weights):
            raise ValueError("Every dataset entry needs a positive `weight` under interleave.")
        total = sum(weights)
        probs = [w / total for w in weights]
        stopping = mixing.get("stopping", "all_exhausted")
        return interleave_datasets(
            datasets, probabilities=probs, seed=seed, stopping_strategy=stopping,
        )

    raise ValueError(f"Unknown mixing.strategy: {strategy}")


# Config assembly ===========================================================
MODEL_KEYS      = ("base_model", "adapter", "resume_from", "run_name", "out_dir",
                   "seed", "max_seq_length", "load_in_4bit", "text_only",
                   "chat_template", "merge", "save_method", "push_hf",
                   "hf_org", "hf_token", "report_to", "log_freq")
HYPERPARAM_KEYS = ("epochs", "batch_size", "grad_acc", "optimizer",
                   "lr", "embed_lr", "scheduler", "warmup_steps", "max_steps",
                   "weight_decay", "save_steps", "eval_steps", "do_eval",
                   "lora_rank", "lora_alpha", "lora_dropout", "target_module",
                   "rslora", "bias", "grad_checkpt", "packing",
                   "instruction_part", "response_part")


def merge_config(recipe: dict) -> dict:
    """Flatten [recipe] + [hyperparams] into the flat config dict runners expect."""
    r  = recipe.get("recipe", {})
    hp = recipe.get("hyperparams", {})
    cfg: dict = {}
    for k in MODEL_KEYS:
        if k in r:
            cfg[k] = r[k]
    for k in HYPERPARAM_KEYS:
        if k in hp:
            cfg[k] = hp[k]
    if "max_seq_len" in hp and "max_seq_length" not in cfg:
        cfg["max_seq_length"] = hp["max_seq_len"]
    if not cfg.get("run_name"):
        cfg["run_name"] = r.get("name", "recipe")
    return cfg


# Public entry point ========================================================
def build_from_recipe(path: str | Path) -> tuple[str, dict, Dataset, Dataset | None]:
    """Read a recipe file → (stage, config, train_ds, eval_ds)."""
    recipe = load_recipe(path)
    r = recipe.get("recipe", {})
    stage = (r.get("stage") or "").lower()
    if stage not in ("cpt", "sft"):
        raise ValueError(f"recipe.stage must be 'cpt' or 'sft', got: {stage!r}")

    cfg  = merge_config(recipe)
    seed = int(cfg.get("seed", 3407))

    entries = recipe.get("datasets") or []
    if not entries:
        raise ValueError("Recipe has no `datasets` entries.")

    train_items, valid_items = [], []
    for entry in entries:
        train_items.extend(entry_datasets(entry, stage, "train"))
        if cfg.get("do_eval"):
            valid_items.extend(entry_datasets(entry, stage, "valid"))

    mixing = recipe.get("mixing", {}) or {"strategy": "concat"}
    train_ds = mix(train_items, mixing, seed)
    if train_ds is None:
        raise ValueError("Recipe produced no training rows.")

    # valid: always concat + shuffle (interleave-with-loop makes no sense for eval)
    eval_ds = mix(valid_items, {"strategy": "concat"}, seed) if valid_items else None

    print(f"[mixer] stage={stage} strategy={mixing.get('strategy','concat')} "
          f"train_rows={len(train_ds)} eval_rows={len(eval_ds) if eval_ds else 0}")
    for label, ds, w, rep in train_items:
        extra = f"weight={w:.3f}" if mixing.get("strategy") == "interleave" else f"repeat={rep}"
        print(f"  {label}  rows={len(ds)}  {extra}")

    return stage, cfg, train_ds, eval_ds
