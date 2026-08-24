import argparse, os, re
from pathlib import Path
from unsloth import FastLanguageModel
import torch
from datasets import load_dataset
from transformers import TrainingArguments
from unsloth import (
    UnslothTrainer,
    UnslothTrainingArguments,
    is_bfloat16_supported,
)
from datetime import datetime
now = datetime.now()
timestamp= now.strftime("%m-%d_%H-%M")

# CLI overrides (any --flag beats the in-file default below) ===============
cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--ds", "--dataset", dest="dataset")
cli.add_argument("--adapter", "--adapter-path", dest="adapter")
cli.add_argument("--epochs", type=int)
cli.add_argument("--lr", type=float)
cli.add_argument("--rank", type=int)
cli.add_argument("--steps", dest="max_steps", type=int)
args, _ = cli.parse_known_args()

# Model Setting ===========================================

ADAPTER_PATH   = args.adapter or ""  # If not empty, train on BASE_MODEL + ADAPTER
BASE_MODEL     = "ornith-ai/Ornith-1.5-9B" # Base model

MAX_SEQ_LENGTH = 4096
DTYPE          = None # None for auto detection
LOAD_IN_4BIT   = True
TEXT_ONLY      = True # Ornith is processor-wrapped VLM; unwrap so adapter keys stay flat (matches eval/inference)

# Dataset Setting ==========================================

DATA_DIR      = f"{Path(__file__).resolve().parent}/../../dataset/cpt"
DATASET       = args.dataset or "Ayush-ground-truth"
DO_EVAL       = False   # CPT eval OOMs on 16GB VRAM (unsloth fp32 upcast); flip when fixed
TRAIN_SET     = [f"{DATA_DIR}/{DATASET}/train.jsonl"]
valid_fp      = Path(f"{DATA_DIR}/{DATASET}/valid.jsonl")
VALID_SET     = [str(valid_fp)] if (DO_EVAL and valid_fp.is_file()) else []

# Output Setting ==========================================

OUT_DIR       = f"{Path(__file__).resolve().parent}/../../output/adapter/{timestamp}-{DATASET}"
OUT_NAME      = f"{BASE_MODEL}"
MERGE         = False
SAVE_METHOD   = "merged_4bit" # or "merged_16bit"

HF_ORG        = "jaseci"
PUSH_HF       = False
HF_TOKEN      = ""
# HF_TOKEN      = os.environ["HF_TOKEN"]

TRAIN_LOG     = ""
REPORT_TO     = ["tensorboard"] # "none", "wandb"
TENSORBRD_DIR = f"{OUT_DIR}/runs" # folder path, empty to disable
LOG_FREQ      = 10

# Hyperparameters =========================================

EPOCHS        = args.epochs or 3
BATCH_SIZE    = 1
GRAD_ACC      = 10

OPTIMIZER     = "adamw_8bit"

LEARNING_RATE = args.lr or 5e-5
EMBED_LR      = 0

SCHEDULER     = "linear"
WARMUP_STEPS  = 5
MAX_STEPS     = args.max_steps if args.max_steps is not None else -1  # < 0 => train by epochs
WEIGHT_DECAY  = 1e-3

SAVE_STEPS    = 50
EVAL_STEPS    = 0.1

LORA_RANK     = args.rank or 128
LORA_ALPHA    = 32
LORA_DROPOUT  = 0
TARGET_MODULE = ["q_proj", "k_proj", "v_proj",
                 "o_proj", "gate_proj",
                 "up_proj", "down_proj",
                 "embed_tokens", "lm_head"]
RSLORA        = True

BIAS          = "none"
GRAD_CHECKPT  = "unsloth"

RANDOM_SEED   = 3407
PACKING       = True   # CPT: safe, big throughput win. Turn off only for debug.
COMPLETION    = False  # SFT

# Enviorment Setting ======================================

# os.environ["UNSLOTH_RETURN_LOGITS"] = "1"

# Load Model ==============================================

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name = ADAPTER_PATH or BASE_MODEL, # Choose ANY! eg teknium/OpenHermes-2.5-Mistral-7B
    max_seq_length = MAX_SEQ_LENGTH,
    dtype = DTYPE,
    load_in_4bit = LOAD_IN_4BIT,
    text_only = TEXT_ONLY,
    # token = "YOUR_HF_TOKEN", # HF Token for gated models
)

# When ADAPTER_PATH is set, from_pretrained already returned a PEFT-wrapped
# model — calling get_peft_model again would double-wrap and error. Shape
# hyperparameters (rank / target_modules / alpha) are then frozen by the
# checkpoint; to change them, merge first (see README).
if not ADAPTER_PATH:
    model = FastLanguageModel.get_peft_model(
        model,
        r               = LORA_RANK,
        target_modules  = TARGET_MODULE,
        lora_alpha      = LORA_ALPHA,
        lora_dropout    = LORA_DROPOUT,
        bias            = BIAS,
        use_gradient_checkpointing = GRAD_CHECKPT,
        random_state    = RANDOM_SEED,
        use_rslora      = RSLORA,
        loftq_config    = None,
    )

# Load Dataset ==============================================

EOS_TOKEN = tokenizer.eos_token

def append_eos(batch):
    return {
        "text": [
            text
            if text.rstrip().endswith(EOS_TOKEN)
            else text + EOS_TOKEN
            for text in batch["text"]
        ]
    }

train_ds = load_dataset("json", data_files={"train": TRAIN_SET}, split="train")
train_ds = train_ds.map(append_eos, batched=True, desc="Appending EOS (train)")

eval_ds = None
if VALID_SET:
    eval_ds = load_dataset("json", data_files={"valid": VALID_SET}, split="valid")
    eval_ds = eval_ds.map(append_eos, batched=True, desc="Appending EOS (valid)")

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

    eval_strategy               = "steps" if eval_ds is not None else "no",
    eval_steps                  = EVAL_STEPS if eval_ds is not None else None,
    per_device_eval_batch_size  = 1,
    eval_accumulation_steps     = 1,        # spill eval logits to CPU each batch
    bf16_full_eval              = is_bfloat16_supported(),  # halves eval VRAM

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

# GPU INFO ================================================

gpu_stats = torch.cuda.get_device_properties(0)
start_gpu_memory = round(torch.cuda.max_memory_reserved() / 1024 / 1024 / 1024, 3)
max_memory = round(gpu_stats.total_memory / 1024 / 1024 / 1024, 3)
print(f"GPU = {gpu_stats.name}. Max memory = {max_memory} GB.")
print(f"{start_gpu_memory} GB of memory reserved.")

# TRAIN ================================================

trainer_stats = trainer.train()

# SAVE ================================================

if MERGE:
    model.save_pretrained_merged(f"{OUT_DIR}/merged", tokenizer, save_method = SAVE_METHOD,)
else:
    model.save_pretrained(f"{OUT_DIR}/adapter")
    tokenizer.save_pretrained(f"{OUT_DIR}/adapter")

if PUSH_HF:
     model.push_to_hub_merged(f"{HF_ORG}/JacLLM-{BASE_MODEL}", tokenizer, save_method = SAVE_METHOD, token = HF_TOKEN)