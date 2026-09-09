import argparse
import sys
from pathlib import Path

from datasets import load_dataset
from unsloth import (
    FastLanguageModel,
    UnslothTrainer,
    UnslothTrainingArguments,
    is_bfloat16_supported,
)

sys.path.insert(0, str(Path(__file__).resolve().parent))
from utils import finalize_out_dir, print_gpu_banner, save_adapter


# Defaults (also the config schema for train.py) ============================
def default_config() -> dict:
    return {
        # Model
        "base_model":     "ornith-ai/Ornith-1.5-9B",
        "adapter":        "",
        "resume_from":    "",
        "max_seq_length": 4096,
        "dtype":          None,
        "load_in_4bit":   True,
        "text_only":      True,   # Ornith is processor-wrapped VLM; unwrap
        # Output
        "run_name":       "",
        "out_dir":        "",
        "merge":          False,
        "save_method":    "merged_4bit",
        "push_hf":        False,
        "hf_org":         "jaseci",
        "hf_repo":        "",
        "hf_token":       "",
        "report_to":      ["tensorboard"],
        "log_freq":       10,
        # Hyperparameters
        "epochs":         3,
        "batch_size":     1,
        "grad_acc":       10,
        "optimizer":      "adamw_8bit",
        "lr":             5e-5,
        "embed_lr":       0,
        "scheduler":      "linear",
        "warmup_steps":   5,
        "max_steps":      -1,
        "weight_decay":   1e-3,
        "save_steps":     50,
        "eval_steps":     0.1,
        "do_eval":        False,  # CPT eval OOMs on 16GB VRAM; flip when fixed
        # LoRA
        "lora_rank":      128,
        "lora_alpha":     32,
        "lora_dropout":   0,
        "target_module": ["q_proj", "k_proj", "v_proj",
                          "o_proj", "gate_proj",
                          "up_proj", "down_proj",
                          "embed_tokens", "lm_head"],
        "rslora":         True,
        "bias":           "none",
        "grad_checkpt":   "unsloth",
        # Misc
        "seed":           3407,
        "packing":        True,  # CPT: safe, big throughput win. Turn off only for debug.
    }


def append_eos(batch: dict, eos: str) -> dict:
    return {
        "text": [
            t if t.rstrip().endswith(eos) else t + eos
            for t in batch["text"]
        ]
    }


def run_cpt(config: dict, train_ds, eval_ds=None):
    """Run one CPT training loop over the given HF datasets.

    `train_ds` and (optional) `eval_ds` must expose a `text` field. Rows are
    normalized here — EOS is appended if missing.
    """
    cfg = {**default_config(), **config}
    finalize_out_dir(cfg)
    Path(cfg["out_dir"], "runs").mkdir(parents=True, exist_ok=True)

    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name     = cfg["adapter"] or cfg["base_model"],
        max_seq_length = cfg["max_seq_length"],
        dtype          = cfg["dtype"],
        load_in_4bit   = cfg["load_in_4bit"],
        text_only      = cfg["text_only"],
    )

    # `adapter` set means from_pretrained already wrapped the model with PEFT;
    # skip get_peft_model to avoid double-wrapping. LoRA shape is then frozen
    # by the checkpoint; to change rank/target_modules, merge first.
    if not cfg["adapter"]:
        model = FastLanguageModel.get_peft_model(
            model,
            r                          = cfg["lora_rank"],
            target_modules             = cfg["target_module"],
            lora_alpha                 = cfg["lora_alpha"],
            lora_dropout               = cfg["lora_dropout"],
            bias                       = cfg["bias"],
            use_gradient_checkpointing = cfg["grad_checkpt"],
            random_state               = cfg["seed"],
            use_rslora                 = cfg["rslora"],
            loftq_config               = None,
        )

    eos = tokenizer.eos_token
    train_ds = train_ds.map(
        lambda b: append_eos(b, eos), batched=True, desc="Appending EOS (train)"
    )
    if eval_ds is not None and cfg["do_eval"]:
        eval_ds = eval_ds.map(
            lambda b: append_eos(b, eos), batched=True, desc="Appending EOS (valid)"
        )
    else:
        eval_ds = None

    training_args = UnslothTrainingArguments(
        per_device_train_batch_size = cfg["batch_size"],
        gradient_accumulation_steps = cfg["grad_acc"],

        num_train_epochs = cfg["epochs"],
        max_steps        = cfg["max_steps"],
        warmup_steps     = cfg["warmup_steps"],

        learning_rate           = cfg["lr"],
        embedding_learning_rate = cfg["embed_lr"],

        optim             = cfg["optimizer"],
        weight_decay      = cfg["weight_decay"],
        lr_scheduler_type = cfg["scheduler"],

        logging_steps = cfg["log_freq"],
        save_steps    = cfg["save_steps"],

        fp16 = not is_bfloat16_supported(),
        bf16 = is_bfloat16_supported(),

        seed       = cfg["seed"],
        output_dir = cfg["out_dir"],

        eval_strategy = "steps" if eval_ds is not None else "no",
        eval_steps    = cfg["eval_steps"] if eval_ds is not None else None,
        per_device_eval_batch_size = 1,
        eval_accumulation_steps    = 1,
        bf16_full_eval             = is_bfloat16_supported(),

        report_to   = cfg["report_to"],
        logging_dir = f"{cfg['out_dir']}/runs",
    )

    trainer = UnslothTrainer(
        model              = model,
        tokenizer          = tokenizer,
        train_dataset      = train_ds,
        eval_dataset       = eval_ds,
        dataset_text_field = "text",
        max_seq_length     = cfg["max_seq_length"],
        dataset_num_proc   = 4,
        packing            = cfg["packing"],
        args               = training_args,
    )

    print_gpu_banner()
    trainer.train(resume_from_checkpoint=cfg["resume_from"] or None)
    save_adapter(model, tokenizer, cfg, stage="cpt")


# CLI (single-dataset workflow — recipes go through train.py) ===============
def config_from_cli() -> tuple[dict, str, str]:
    cli = argparse.ArgumentParser(add_help=False)
    cli.add_argument("--ds", "--dataset", dest="dataset")
    cli.add_argument("--adapter", "--adapter-path", dest="adapter")
    cli.add_argument("--epochs", type=int)
    cli.add_argument("--lr", type=float)
    cli.add_argument("--rank", type=int)
    cli.add_argument("--steps", dest="max_steps", type=int)
    cli.add_argument("--resume", dest="resume",
                     help="checkpoint dir to resume from (mutex with --adapter)")
    args, _ = cli.parse_known_args()
    if args.resume and args.adapter:
        raise SystemExit(
            "--resume and --adapter are mutually exclusive; --resume already "
            "loads adapter weights + optimizer state"
        )

    cfg = default_config()
    dataset = args.dataset or "Ayush-ground-truth"
    cfg["adapter"]      = args.adapter or ""
    cfg["resume_from"]  = args.resume  or ""
    if args.epochs    is not None: cfg["epochs"]    = args.epochs
    if args.lr        is not None: cfg["lr"]        = args.lr
    if args.rank      is not None: cfg["lora_rank"] = args.rank
    if args.max_steps is not None: cfg["max_steps"] = args.max_steps
    cfg["run_name"] = dataset

    data_dir = Path(__file__).resolve().parent.parent.parent / "dataset" / "cpt"
    return cfg, str(data_dir / dataset / "train.jsonl"), str(data_dir / dataset / "valid.jsonl")


if __name__ == "__main__":
    cfg, train_fp, valid_fp = config_from_cli()

    train_ds = load_dataset("json", data_files={"train": [train_fp]}, split="train")
    eval_ds  = None
    if cfg["do_eval"] and Path(valid_fp).is_file():
        eval_ds = load_dataset("json", data_files={"valid": [valid_fp]}, split="valid")

    run_cpt(cfg, train_ds, eval_ds)
