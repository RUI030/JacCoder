import os
from pathlib import Path
import torch
from unsloth import FastLanguageModel

# BASE    = "ornith-ai/Ornith-1.5-9B"
ADAPTER = "path/to/adapter" # a folder taht has an adapetr config
OUT     = f"{Path(__file__).resolve().parent}/merged/{Path(ADAPTER).name}"
Q4bit   = True

max_seq_length  = 16384 
dtype           = None  # None for auto detection. Float16 for Tesla T4, V100, Bfloat16 for Ampere+
load_in_4bit    = Q4bit 

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name     = ADAPTER, # Choose ANY! eg teknium/OpenHermes-2.5-Mistral-7B
    max_seq_length = max_seq_length,
    dtype          = dtype,
    load_in_4bit   = load_in_4bit,
    # token = "YOUR_HF_TOKEN", # HF Token for gated models
)

os.makedirs(OUT, exist_ok=True)

if Q4bit:
    model.save_pretrained_merged(f"{OUT}-4bit", tokenizer, save_method = "merged_4bit",)
else:
    model.save_pretrained_merged(f"{OUT}", tokenizer, save_method = "merged_16bit",)
