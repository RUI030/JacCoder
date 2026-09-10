"""Merge a LoRA adapter into its base model and save as a portable folder.

`text_only=True` unwraps Ornith's processor VLM wrapper so the result is a
clean Qwen3.5-style dense LM — required for Unsloth Studio / vLLM / llama.cpp
to load it without CPU-offload errors.

Usage:
    python script/merge_lora.py \\
        --adapter output/adapter/<run>/adapter \\
        --out output/model/<name>
"""

import argparse, json, struct
from pathlib import Path

from unsloth import FastLanguageModel

# Setting =================================================
ADAPTER   = "path/to/adapter"    # override with --adapter
OUT       = ""                   # override with --out; empty => output/model/<adapter_dir_name>
Q4BIT     = True                 # merged_4bit vs merged_16bit
TEXT_ONLY = True                 # unwrap Ornith processor VLM wrapper

MAX_SEQ_LENGTH = 16384
DTYPE          = None


# Functions ===============================================
def fix_text_only_weight_prefix(out_dir: Path) -> int:
    """Align Qwen3.5 text-only safetensor keys with its text config."""
    prefix = "language_model."
    changed = 0

    for model_file in sorted(out_dir.glob("*.safetensors")):
        with model_file.open("rb") as file:
            header_size = struct.unpack("<Q", file.read(8))[0]
            header = json.loads(file.read(header_size))

        renamed = {}
        file_changed = 0
        for name, value in header.items():
            new_name = name if name == "__metadata__" else name.removeprefix(prefix)
            if new_name in renamed:
                raise RuntimeError(f"Duplicate tensor key after prefix repair: {new_name}")
            renamed[new_name] = value
            file_changed += new_name != name

        if not file_changed:
            continue
        new_header = json.dumps(renamed, separators=(",", ":")).encode("utf-8")
        if len(new_header) > header_size:
            raise RuntimeError(f"Repaired header does not fit in {model_file}")
        new_header += b" " * (header_size - len(new_header))
        with model_file.open("r+b") as file:
            file.seek(8)
            file.write(new_header)
        changed += file_changed

    index_file = out_dir / "model.safetensors.index.json"
    if changed and index_file.is_file():
        index = json.loads(index_file.read_text(encoding="utf-8"))
        index["weight_map"] = {
            name.removeprefix(prefix): shard
            for name, shard in index["weight_map"].items()
        }
        index_file.write_text(json.dumps(index, indent=2) + "\n", encoding="utf-8")

    return changed


def is_local_4bit_base(adapter_path: Path) -> bool:
    """Return whether this adapter was trained on a local merged 4-bit base."""
    adapter_cfg = json.loads(
        (adapter_path / "adapter_config.json").read_text(encoding="utf-8")
    )
    base_path = Path(adapter_cfg["base_model_name_or_path"])
    if not base_path.is_absolute():
        base_path = PROJECT_ROOT / base_path
    if not base_path.is_dir():
        return False

    base_cfg = json.loads((base_path / "config.json").read_text(encoding="utf-8"))
    quant_cfg = base_cfg.get("quantization_config", {})
    return (
        quant_cfg.get("quant_method") == "bitsandbytes"
        and quant_cfg.get("load_in_4bit") is True
    )


def clear_weight_conversions(model) -> int:
    """Keep native model keys when resaving a local merged 4-bit base."""
    cleared = 0
    seen = set()
    for module in model.modules():
        if id(module) in seen:
            continue
        seen.add(id(module))
        conversions = getattr(module, "_weight_conversions", None)
        if not conversions:
            continue
        module._weight_conversions = []
        cleared += len(conversions)
    return cleared

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
    if is_local_4bit_base(adapter_path):
        cleared = clear_weight_conversions(model)
        print(f"Local 4-bit base weight conversions cleared: {cleared}")
    model.save_pretrained_merged(str(out_path), tokenizer, save_method=save_method)
    if TEXT_ONLY:
        repaired = fix_text_only_weight_prefix(out_path)
        print(f"Text-only key-prefix repairs: {repaired}")

print(f"\nDone. Merged model at: {out_path}")
print(f"Check size: du -sh {out_path}")
