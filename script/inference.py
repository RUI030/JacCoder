"""Interactive multi-turn inference for the Ornith CPT adapter."""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent))
from utils.model import load_model, generate


# Model settings ==============================================================

PROJECT_ROOT = Path(__file__).resolve().parent

BASE_MODEL   = "ornith-ai/Ornith-1.5-9B"
ADAPTER_PATH = (
    PROJECT_ROOT / "output/adapter/08-21_22-58-Ayush-ground-truth/checkpoint-195"
)

MAX_SEQ_LENGTH = 4096
DTYPE          = None
LOAD_IN_4BIT   = True


# Generation settings =========================================================

SYSTEM_PROMPT      = "You are an expert AI assistant specializing in the jac programming language."
MAX_NEW_TOKENS     = 512
TEMPERATURE        = 0.7
TOP_P              = 0.9
REPETITION_PENALTY = 1.05
ENABLE_THINKING    = False


def resolve_model_name() -> str:
    """Prefer local adapter when its config exists, else base model."""
    if (ADAPTER_PATH / "adapter_config.json").is_file():
        print(f"Loading adapter: {ADAPTER_PATH}")
        return str(ADAPTER_PATH)
    print(f"Adapter not found at {ADAPTER_PATH}")
    return BASE_MODEL


def chat(model, tokenizer):
    """Run a multi-turn terminal chat until Ctrl+C or EOF."""
    messages = []
    if SYSTEM_PROMPT:
        messages.append({"role": "system", "content": SYSTEM_PROMPT})

    print("\nInteractive Ornith chat")
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
        print(f"Ornith: {reply}\n")


def main():
    model, tokenizer = load_model(resolve_model_name(), MAX_SEQ_LENGTH, LOAD_IN_4BIT, DTYPE)
    chat(model, tokenizer)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\nExiting.")
