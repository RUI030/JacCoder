"""Interactive multi-turn inference for the Ornith CPT adapter."""

from pathlib import Path

from unsloth import FastLanguageModel
import torch


# Model settings ==============================================================

PROJECT_ROOT = Path(__file__).resolve().parent

BASE_MODEL = "ornith-ai/Ornith-1.5-9B"
ADAPTER_PATH = (
    PROJECT_ROOT / "output/08-21_22-58-Ayush-ground-truth/checkpoint-195"
)

MAX_SEQ_LENGTH = 4096
DTYPE = None
LOAD_IN_4BIT = True


# Generation settings =========================================================

SYSTEM_PROMPT = "You are a helpful assistant."
MAX_NEW_TOKENS = 512
TEMPERATURE = 0.7
TOP_P = 0.9
REPETITION_PENALTY = 1.05
ENABLE_THINKING = False


def load_model():
    """Load the local adapter when present, otherwise load the base model."""
    if (ADAPTER_PATH / "adapter_config.json").is_file():
        model_name = str(ADAPTER_PATH)
        print(f"Loading adapter: {model_name}")
    else:
        model_name = BASE_MODEL
        print(f"Adapter not found at {ADAPTER_PATH}")
        print(f"Loading base model: {model_name}")

    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_name,
        max_seq_length=MAX_SEQ_LENGTH,
        dtype=DTYPE,
        load_in_4bit=LOAD_IN_4BIT,
        text_only=True,
        fast_inference=False,
    )

    # Unsloth 2026.8.19 can leave architectures=None when a Qwen3.5 VLM
    # adapter is loaded through its text-only config. Its generation wrapper
    # expects an iterable, so restore the actual loaded base-model class name.
    base_model = model.get_base_model() if hasattr(model, "get_base_model") else model
    architecture = type(base_model).__name__
    configs = (model.config, base_model.config)
    for index, config in enumerate(configs):
        if index and config is configs[0]:
            continue
        if not getattr(config, "architectures", None):
            config.architectures = [architecture]

    FastLanguageModel.for_inference(model)
    tokenizer.truncation_side = "left"
    return model, tokenizer


def generate_reply(model, tokenizer, messages):
    """Generate one assistant response using the complete conversation."""
    prompt_limit = MAX_SEQ_LENGTH - MAX_NEW_TOKENS
    if prompt_limit <= 0:
        raise ValueError("MAX_NEW_TOKENS must be smaller than MAX_SEQ_LENGTH")

    inputs = tokenizer.apply_chat_template(
        messages,
        tokenize=True,
        add_generation_prompt=True,
        enable_thinking=ENABLE_THINKING,
        truncation=True,
        max_length=prompt_limit,
        return_tensors="pt",
        return_dict=True,
    ).to("cuda")

    generation_args = {
        "max_new_tokens": MAX_NEW_TOKENS,
        "use_cache": True,
        "repetition_penalty": REPETITION_PENALTY,
        "pad_token_id": tokenizer.pad_token_id or tokenizer.eos_token_id,
    }
    if TEMPERATURE > 0:
        generation_args.update(
            do_sample=True,
            temperature=TEMPERATURE,
            top_p=TOP_P,
        )
    else:
        generation_args["do_sample"] = False

    prompt_tokens = inputs["input_ids"].shape[-1]
    with torch.inference_mode():
        outputs = model.generate(**inputs, **generation_args)

    new_tokens = outputs[0, prompt_tokens:]
    return tokenizer.decode(new_tokens, skip_special_tokens=True).strip()


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
        reply = generate_reply(model, tokenizer, messages)
        messages.append({"role": "assistant", "content": reply})
        print(f"Ornith: {reply}\n")


def main():
    model, tokenizer = load_model()
    chat(model, tokenizer)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\nExiting.")
