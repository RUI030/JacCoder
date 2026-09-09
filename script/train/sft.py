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
from unsloth.chat_templates import get_chat_template, train_on_responses_only

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
        "text_only":      True,
        "chat_template":  "qwen-2.5",  # Ornith is Qwen3-based; qwen-2.5 template is compatible
        # Output
        "run_name":       "",
        "out_dir":        "",
        "merge":          False,
        "save_method":    "merged_4bit",
        "push_hf":        False,
        "hf_org":         "jaseci",
        "hf_token":       "",
        "report_to":      ["tensorboard"],
        "log_freq":       10,
        # Hyperparameters
        "epochs":         1,
        "batch_size":     1,
        "grad_acc":       10,
        "optimizer":      "adamw_8bit",
        "lr":             2e-4,       # SFT LoRA standard, higher than CPT's 5e-5
        "embed_lr":       0,          # embed/lm_head not in TARGET_MODULE
        "scheduler":      "linear",
        "warmup_steps":   10,
        "max_steps":      -1,
        "weight_decay":   1e-3,
        "save_steps":     100,
        "eval_steps":     0.1,
        "do_eval":        False,      # SFT eval OOMs on 16GB VRAM; use gate/loss post-hoc
        # LoRA
        "lora_rank":      64,          # SFT: lower than CPT's 128
        "lora_alpha":     16,
        "lora_dropout":   0,
        "target_module": ["q_proj", "k_proj", "v_proj",
                          "o_proj", "gate_proj",
                          "up_proj", "down_proj"],  # NO embed/lm_head for SFT
        "rslora":         True,
        "bias":           "none",
        "grad_checkpt":   "unsloth",
        # Misc
        "seed":           3407,
        "packing":        False,  # keep False unless response-mask is confirmed correct
        # Response-only masking (chat template dependent)
        "instruction_part": "<|im_start|>user\n",
        "response_part":    "<|im_start|>assistant\n",
    }


def apply_chat_template(batch: dict, tokenizer) -> dict:
    return {
        "text": [
            tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=False)
            for msgs in batch["messages"]
        ]
    }


def run_sft(config: dict, train_ds, eval_ds=None):
    """Run one SFT training loop over the given HF datasets.

    `train_ds` and (optional) `eval_ds` must expose a `messages` field — a
    list of role/content dicts. The chat template is applied here.
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
    tokenizer = get_chat_template(tokenizer, chat_template=cfg["chat_template"])

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

    train_ds = train_ds.map(
        lambda b: apply_chat_template(b, tokenizer),
        batched=True, desc="Applying chat template (train)",
    )
    if eval_ds is not None and cfg["do_eval"]:
        eval_ds = eval_ds.map(
            lambda b: apply_chat_template(b, tokenizer),
            batched=True, desc="Applying chat template (valid)",
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

    # Loss only on assistant tokens (mask system + user)
    trainer = train_on_responses_only(
        trainer,
        instruction_part = cfg["instruction_part"],
        response_part    = cfg["response_part"],
    )

    print_gpu_banner()
    trainer.train(resume_from_checkpoint=cfg["resume_from"] or None)
    save_adapter(model, tokenizer, cfg, stage="sft")


# CLI (single-dataset workflow — recipes go through train.py) ===============
def config_from_cli() -> tuple[dict, str, str]:
    cli = argparse.ArgumentParser(add_help=False)
    cli.add_argument("--ds", "--dataset", dest="dataset")
    cli.add_argument("--task", "--task-type", dest="task")
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

    cfg  = default_config()
    task = args.task    or "code_completion"
    ds   = args.dataset or "Nitin-10k-jac-functions"
    cfg["adapter"]     = args.adapter or ""
    cfg["resume_from"] = args.resume  or ""
    if args.epochs    is not None: cfg["epochs"]    = args.epochs
    if args.lr        is not None: cfg["lr"]        = args.lr
    if args.rank      is not None: cfg["lora_rank"] = args.rank
    if args.max_steps is not None: cfg["max_steps"] = args.max_steps
    cfg["run_name"] = f"sft-{task}-{ds}"

    data_dir = Path(__file__).resolve().parent.parent.parent / "dataset" / "sft"
    return cfg, str(data_dir / task / ds / "train.jsonl"), str(data_dir / task / ds / "valid.jsonl")


if __name__ == "__main__":
    cfg, train_fp, valid_fp = config_from_cli()

    train_ds = load_dataset("json", data_files={"train": [train_fp]}, split="train")
    eval_ds  = None
    if cfg["do_eval"] and Path(valid_fp).is_file():
        eval_ds = load_dataset("json", data_files={"valid": [valid_fp]}, split="valid")

    run_sft(cfg, train_ds, eval_ds)
