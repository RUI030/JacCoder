"""Merge a LoRA adapter into its base model and save as a portable folder.

`text_only=True` unwraps Ornith's processor VLM wrapper so the result is a
clean Qwen3.5-style dense LM — required for Unsloth Studio / vLLM / llama.cpp
to load it without CPU-offload errors.

Usage:
    python script/merge_lora.py \\
        --adapter output/adapter/<run>/adapter \\
        --out output/model/<name>
"""

import argparse
from pathlib import Path

from unsloth import FastLanguageModel

# Setting =================================================
ADAPTER   = "path/to/adapter"    # override with --adapter
OUT       = ""                   # override with --out; empty => output/model/<adapter_dir_name>
Q4BIT     = True                 # merged_4bit vs merged_16bit
TEXT_ONLY = True                 # unwrap Ornith processor VLM wrapper

MAX_SEQ_LENGTH = 16384
DTYPE          = None

# CLI overrides ============================================
cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--adapter", dest="adapter", help="path to adapter/ folder")
cli.add_argument("--out",     dest="out",     help="output folder (default: output/model/<adapter_dir_name>)")
cli.add_argument("--no-4bit", dest="no_4bit", action="store_true", help="save as merged_16bit instead of merged_4bit")
cli.add_argument("--gguf",    dest="gguf",    help="export GGUF instead of HF merged. Value = quant method: q4_k_m / q5_k_m / q8_0 / iq4_xs / f16")
cli.add_argument("--keep-vlm-wrapper", dest="keep_wrapper", action="store_true", help="skip text_only unwrap (keep processor wrapper)")
args, _ = cli.parse_known_args()
if args.adapter:      ADAPTER   = args.adapter
if args.out:          OUT       = args.out
if args.no_4bit:      Q4BIT     = False
if args.keep_wrapper: TEXT_ONLY = False

if ADAPTER == "path/to/adapter":
    raise SystemExit("Provide --adapter <path> or edit ADAPTER at top of file")
adapter_path = Path(ADAPTER).resolve()
if not adapter_path.is_dir():
    raise SystemExit(f"adapter path not found: {adapter_path}")

PROJECT_ROOT = Path(__file__).resolve().parent.parent
if not OUT:
    OUT = str(PROJECT_ROOT / "output" / "model" / adapter_path.name)
out_path = Path(OUT).resolve()
out_path.parent.mkdir(parents=True, exist_ok=True)

print(f"Adapter   : {adapter_path}")
print(f"Out       : {out_path}")
print(f"Quant     : {'4bit' if Q4BIT else '16bit'}")
print(f"Text-only : {TEXT_ONLY}")

# Load =====================================================
model, tokenizer = FastLanguageModel.from_pretrained(
    model_name     = str(adapter_path),
    max_seq_length = MAX_SEQ_LENGTH,
    dtype          = DTYPE,
    load_in_4bit   = Q4BIT,
    text_only      = TEXT_ONLY,
)

# Repair config.architectures: unsloth's text_only unwrap can leave this
# empty on the saved intermediate config → GGUF converter (and llama.cpp)
# fail with "Failed to detect model architecture". Backfill from the base
# module's class name (e.g. Qwen3ForCausalLM) which llama.cpp recognises.
base = model.get_base_model() if hasattr(model, "get_base_model") else model
arch = type(base).__name__
seen = set()
for cfg in (model.config, base.config):
    if id(cfg) in seen:
        continue
    seen.add(id(cfg))
    if not getattr(cfg, "architectures", None):
        cfg.architectures = [arch]
print(f"Architectures: {model.config.architectures}")

# Save =====================================================
if args.gguf:
    # GGUF: unsloth does merge internally then quantizes to the given method.
    # Output is a single .gguf file suitable for llama.cpp / Ollama / lm-studio.
    print(f"Method    : gguf ({args.gguf})")
    model.save_pretrained_gguf(str(out_path), tokenizer, quantization_method=args.gguf)
else:
    # merged_4bit_forced: unsloth refuses plain merged_4bit unless you opt in
    # (warns about accuracy loss if you plan to convert to GGUF afterwards).
    # We're doing this as a terminal step for Studio/vLLM inference, not a
    # staging point, so forced is the right choice.
    save_method = "merged_4bit_forced" if Q4BIT else "merged_16bit"
    print(f"Method    : {save_method}")
    model.save_pretrained_merged(str(out_path), tokenizer, save_method=save_method)

print(f"\nDone. Merged model at: {out_path}")
print(f"Check size: du -sh {out_path}")
