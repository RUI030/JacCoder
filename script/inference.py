"""Interactive multi-turn inference for a local JacLLM model or adapter."""

import json, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent))
from utils.model import load_model, generate


# Model settings ==============================================================

PROJECT_ROOT = Path(__file__).resolve().parent

BASE_MODEL = "ornith-ai/Ornith-1.5-9B"
MODEL_PATH = (
    PROJECT_ROOT / "../output/model/JacLLM-SFT-Ornith-9B-v1.2"
).resolve()

MAX_SEQ_LENGTH = 4096
DTYPE          = None
LOAD_IN_4BIT   = True


# Generation settings =========================================================

SYSTEM_PROMPT      = "You are an expert AI assistant specializing in the jac programming language."
MAX_NEW_TOKENS     = 2048
TEMPERATURE        = 0.7
TOP_P              = 0.9
REPETITION_PENALTY = 1.05
ENABLE_THINKING    = False


def resolve_model_name() -> str:
    """Prefer a local merged model or adapter dir when present, else the
    base model on the HF hub."""
    if (MODEL_PATH / "config.json").is_file() or \
       (MODEL_PATH / "adapter_config.json").is_file():
        print(f"Loading local: {MODEL_PATH}")
        return str(MODEL_PATH)
    print(f"Local model not found at {MODEL_PATH}; falling back to base")
    return BASE_MODEL


def model_label(model_name: str) -> str:
    """Short chat label from the base model id: `unsloth/qwen3-coder-...` -> `qwen3`.

    Local dirs are resolved to the base id recorded in adapter_config.json
    (adapters) or config.json (merged models) before taking the first section.
    """
    path = Path(model_name)
    for fname, key in (("adapter_config.json", "base_model_name_or_path"),
                       ("config.json",         "_name_or_path")):
        if (path / fname).is_file():
            model_name = json.loads((path / fname).read_text()).get(key) or model_name
            break
    return model_name.rstrip("/").split("/")[-1].split("-")[0].lower()


def chat(model, tokenizer, label: str):
    """Run a multi-turn terminal chat until Ctrl+C or EOF."""
    messages = []
    if SYSTEM_PROMPT:
        messages.append({"role": "system", "content": SYSTEM_PROMPT})

    print(f"\nInteractive {label} chat")
    print("Press Ctrl+C to exit. Type /clear to reset conversation history.\n")

    while True:
        try:
            user_text = input("You: ").strip()
        except EOFError:
            print()
            break

        if not user_text:
            continue
        if user_text == "/clear":
            messages = []
            if SYSTEM_PROMPT:
                messages.append({"role": "system", "content": SYSTEM_PROMPT})
            print("Conversation history cleared.\n")
            continue

        messages.append({"role": "user", "content": user_text})
        reply = generate(
            model, tokenizer, messages,
            max_new_tokens=MAX_NEW_TOKENS,
            temperature=TEMPERATURE,
            top_p=TOP_P,
            repetition_penalty=REPETITION_PENALTY,
            enable_thinking=ENABLE_THINKING,
        )
        messages.append({"role": "assistant", "content": reply})
        print(f"{label}: {reply}\n")


def main():
    model_name = resolve_model_name()
    model, tokenizer = load_model(model_name, MAX_SEQ_LENGTH, LOAD_IN_4BIT, DTYPE)
    chat(model, tokenizer, model_label(model_name))


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\nExiting.")
