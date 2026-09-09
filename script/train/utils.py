"""Shared helpers for CPT / SFT training scripts."""

from __future__ import annotations

from datetime import datetime
from pathlib import Path

import torch


REPO_ROOT   = Path(__file__).resolve().parent.parent.parent
OUTPUT_ROOT = REPO_ROOT / "output" / "adapter"


def finalize_out_dir(cfg: dict) -> None:
    """Populate cfg['out_dir'] with `<OUTPUT_ROOT>/<MM-DD_HH-MM>-<run_name>` if unset."""
    if cfg.get("out_dir"):
        return
    ts  = datetime.now().strftime("%m-%d_%H-%M")
    tag = cfg.get("run_name") or "run"
    cfg["out_dir"] = str((OUTPUT_ROOT / f"{ts}-{tag}").resolve())


def print_gpu_banner() -> None:
    """Print current GPU name and reserved / total memory."""
    stats    = torch.cuda.get_device_properties(0)
    reserved = round(torch.cuda.max_memory_reserved() / 1024 / 1024 / 1024, 3)
    total    = round(stats.total_memory / 1024 / 1024 / 1024, 3)
    print(f"GPU = {stats.name}. Max memory = {total} GB.")
    print(f"{reserved} GB of memory reserved.")


def save_adapter(model, tokenizer, cfg: dict, stage: str) -> None:
    """Persist the trained adapter (or merged model) and optionally push to HF."""
    out = cfg["out_dir"]
    if cfg.get("merge"):
        model.save_pretrained_merged(f"{out}/merged", tokenizer, save_method=cfg["save_method"])
    else:
        model.save_pretrained(f"{out}/adapter")
        tokenizer.save_pretrained(f"{out}/adapter")
    if cfg.get("push_hf"):
        repo = f"{cfg['hf_org']}/JacLLM-{cfg['base_model']}"
        if stage == "sft":
            repo += "-sft"
        model.push_to_hub_merged(repo, tokenizer, save_method=cfg["save_method"], token=cfg["hf_token"])
