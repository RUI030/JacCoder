import argparse, os, sys
from datetime import datetime
from pathlib import Path

from unsloth import (
    FastLanguageModel,
    UnslothTrainer,
    UnslothTrainingArguments,
    is_bfloat16_supported,
)
from unsloth.chat_templates import (
    get_chat_template,
    train_on_responses_only,
)
import torch
from datasets import load_dataset

sys.path.append(str(Path(__file__).resolve().parent.parent))

now = datetime.now()
timestamp = now.strftime("%m-%d_%H-%M")

# CLI overrides (any --flag beats the in-file default below) ===============
cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--ds", "--dataset", dest="dataset")
cli.add_argument("--task", "--task-type", dest="task")
cli.add_argument("--adapter", "--adapter-path", dest="adapter")
cli.add_argument("--epochs", type=int)
cli.add_argument("--lr", type=float)
cli.add_argument("--rank", type=int)
cli.add_argument("--steps", dest="max_steps", type=int)
cli.add_argument("--resume", dest="resume", help="checkpoint-N dir to resume from (restores optimizer/scheduler/RNG); mutex with --adapter")
args, _ = cli.parse_known_args()
if args.resume and args.adapter:
    raise SystemExit("--resume and --adapter are mutually exclusive; --resume already loads adapter weights + optimizer state")

# Model Setting ===========================================

ADAPTER_PATH   = args.adapter or ""  # If not empty, train on BASE_MODEL + ADAPTER
RESUME_FROM    = args.resume  or ""  # If not empty, resume trainer state from this checkpoint dir
BASE_MODEL     = "ornith-ai/Ornith-1.5-9B"

MAX_SEQ_LENGTH = 4096
DTYPE          = None
LOAD_IN_4BIT   = True
TEXT_ONLY      = True  # Ornith is processor-wrapped VLM; unwrap so adapter keys stay flat (matches eval/inference)
CHAT_TEMPLATE  = "qwen-2.5"  # Ornith is Qwen3-based; qwen-2.5 template is compatible

# Dataset Setting ==========================================

DATA_DIR   = f"{Path(__file__).resolve().parent}/../../dataset/sft"
TASK_TYPE  = args.task    or "code_completion"           # code_completion / js2jac / py2jac / code_gen / qa
DATASET    = args.dataset or "Nitin-10k-jac-functions"   # dataset folder under TASK_TYPE
TRAIN_SET  = [f"{DATA_DIR}/{TASK_TYPE}/{DATASET}/train.jsonl"]
VALID_SET  = [f"{DATA_DIR}/{TASK_TYPE}/{DATASET}/valid.jsonl"]

# Output Setting ==========================================

OUT_DIR       = f"{Path(__file__).resolve().parent}/../../output/adapter/{timestamp}-sft-{TASK_TYPE}-{DATASET}"
OUT_NAME      = f"{BASE_MODEL}-sft-{TASK_TYPE}"
MERGE         = False
SAVE_METHOD   = "merged_4bit"

HF_ORG        = "jaseci"
PUSH_HF       = False
HF_TOKEN      = ""

REPORT_TO     = ["tensorboard"]
TENSORBRD_DIR = f"{OUT_DIR}/runs"
LOG_FREQ      = 10

# Hyperparameters =========================================

EPOCHS        = args.epochs or 2
BATCH_SIZE    = 1
GRAD_ACC      = 10

OPTIMIZER     = "adamw_8bit"

LEARNING_RATE = args.lr or 2e-4  # SFT LoRA standard, higher than CPT's 5e-5
EMBED_LR      = 0     # not training embed/lm_head in SFT (see TARGET_MODULE)

SCHEDULER     = "linear"
WARMUP_STEPS  = 10
MAX_STEPS     = args.max_steps if args.max_steps is not None else -1  # < 0 => train by epochs
WEIGHT_DECAY  = 1e-3

SAVE_STEPS    = 100
EVAL_STRATEGY = "steps"
EVAL_STEPS    = 0.1

LORA_RANK     = args.rank or 64    # SFT: lower than CPT's 128
LORA_ALPHA    = 16
LORA_DROPOUT  = 0
TARGET_MODULE = ["q_proj", "k_proj", "v_proj",
                 "o_proj", "gate_proj",
                 "up_proj", "down_proj"]  # NO embed_tokens/lm_head for SFT
RSLORA        = True

BIAS          = "none"
GRAD_CHECKPT  = "unsloth"

RANDOM_SEED   = 3407
PACKING       = False  # keep False unless response-mask is confirmed correct

# Response-only masking (chat template dependent)
INSTRUCTION_PART = "<|im_start|>user\n"
RESPONSE_PART    = "<|im_start|>assistant\n"

# Load Model ==============================================

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name     = ADAPTER_PATH or BASE_MODEL,
    max_seq_length = MAX_SEQ_LENGTH,
    dtype          = DTYPE,
    load_in_4bit   = LOAD_IN_4BIT,
    text_only      = TEXT_ONLY,
)

tokenizer = get_chat_template(tokenizer, chat_template=CHAT_TEMPLATE)

# When ADAPTER_PATH is set, from_pretrained already returned a PEFT-wrapped
# model — calling get_peft_model again would double-wrap and error. Shape
# hyperparameters (rank / target_modules / alpha) are then frozen by the
# checkpoint; to change them, merge first (see README).
if not ADAPTER_PATH:
    model = FastLanguageModel.get_peft_model(
        model,
        r                          = LORA_RANK,
        target_modules             = TARGET_MODULE,
        lora_alpha                 = LORA_ALPHA,
        lora_dropout               = LORA_DROPOUT,
        bias                       = BIAS,
        use_gradient_checkpointing = GRAD_CHECKPT,
        random_state               = RANDOM_SEED,
        use_rslora                 = RSLORA,
        loftq_config               = None,
    )

# Load Dataset ==============================================

def formatting_func(batch):
    """Turn `messages` list into a single string via chat template."""
    return {
        "text": [
            tokenizer.apply_chat_template(
                msgs, tokenize=False, add_generation_prompt=False,
            )
            for msgs in batch["messages"]
        ]
    }


train_ds = load_dataset("json", data_files={"train": TRAIN_SET}, split="train")
train_ds = train_ds.map(formatting_func, batched=True, desc="Applying chat template (train)")

eval_ds = None
if VALID_SET and all(Path(p).is_file() for p in VALID_SET):
    eval_ds = load_dataset("json", data_files={"valid": VALID_SET}, split="valid")
    eval_ds = eval_ds.map(formatting_func, batched=True, desc="Applying chat template (valid)")

# Training Config =========================================

training_args = UnslothTrainingArguments(
    per_device_train_batch_size = BATCH_SIZE,
    gradient_accumulation_steps = GRAD_ACC,

    num_train_epochs            = EPOCHS,
    max_steps                   = MAX_STEPS,
    warmup_steps                = WARMUP_STEPS,

    learning_rate               = LEARNING_RATE,
    embedding_learning_rate     = EMBED_LR,

    optim                       = OPTIMIZER,
    weight_decay                = WEIGHT_DECAY,
    lr_scheduler_type           = SCHEDULER,

    logging_steps               = LOG_FREQ,
    save_steps                  = SAVE_STEPS,

    fp16                        = not is_bfloat16_supported(),
    bf16                        = is_bfloat16_supported(),

    seed                        = RANDOM_SEED,
    output_dir                  = OUT_DIR,

    eval_strategy               = EVAL_STRATEGY if eval_ds is not None else "no",
    eval_steps                  = EVAL_STEPS if eval_ds is not None else None,

    report_to                   = REPORT_TO,
    logging_dir                 = TENSORBRD_DIR,
)

trainer = UnslothTrainer(
    model              = model,
    tokenizer          = tokenizer,
    train_dataset      = train_ds,
    eval_dataset       = eval_ds,
    dataset_text_field = "text",
    max_seq_length     = MAX_SEQ_LENGTH,
    dataset_num_proc   = 4,
    packing            = PACKING,
    args               = training_args,
)

# Loss only on assistant tokens (mask system + user)
trainer = train_on_responses_only(
    trainer,
    instruction_part = INSTRUCTION_PART,
    response_part    = RESPONSE_PART,
)

# GPU INFO ================================================

gpu_stats = torch.cuda.get_device_properties(0)
start_gpu_memory = round(torch.cuda.max_memory_reserved() / 1024 / 1024 / 1024, 3)
max_memory = round(gpu_stats.total_memory / 1024 / 1024 / 1024, 3)
print(f"GPU = {gpu_stats.name}. Max memory = {max_memory} GB.")
print(f"{start_gpu_memory} GB of memory reserved.")

# TRAIN ================================================

trainer_stats = trainer.train(resume_from_checkpoint=RESUME_FROM or None)

# SAVE ================================================

if MERGE:
    model.save_pretrained_merged(f"{OUT_DIR}/merged", tokenizer, save_method=SAVE_METHOD)
else:
    model.save_pretrained(f"{OUT_DIR}/adapter")
    tokenizer.save_pretrained(f"{OUT_DIR}/adapter")

if PUSH_HF:
    model.push_to_hub_merged(
        f"{HF_ORG}/JacLLM-{BASE_MODEL}-sft-{TASK_TYPE}",
        tokenizer, save_method=SAVE_METHOD, token=HF_TOKEN,
    )
