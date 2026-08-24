"""Shared Unsloth model loading + single-turn generation."""

from unsloth import FastLanguageModel
import torch


def load_model(
    model_name: str,
    max_seq_length: int,
    load_in_4bit: bool = True,
    dtype=None,
):
    """Load base model or LoRA adapter path.

    Restores `config.architectures` after the Unsloth 2026.8.19 text-only VLM
    adapter path leaves it as None, which breaks `generate()`.
    """
    print(f"Loading: {model_name}")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_name,
        max_seq_length=max_seq_length,
        dtype=dtype,
        load_in_4bit=load_in_4bit,
        text_only=True,
        fast_inference=False,
    )

    base = model.get_base_model() if hasattr(model, "get_base_model") else model
    arch = type(base).__name__
    seen = set()
    for cfg in (model.config, base.config):
        if id(cfg) in seen:
            continue
        seen.add(id(cfg))
        if not getattr(cfg, "architectures", None):
            cfg.architectures = [arch]

    FastLanguageModel.for_inference(model)
    tokenizer.truncation_side = "left"
    return model, tokenizer


def generate(
    model,
    tokenizer,
    messages,
    max_new_tokens: int = 1024,
    temperature: float = 0.0,
    top_p: float = 0.9,
    repetition_penalty: float = 1.05,
    enable_thinking: bool = False,
) -> str:
    """Generate one assistant reply given a full message list."""
    max_seq = getattr(model.config, "max_position_embeddings", None) or 4096
    prompt_limit = max_seq - max_new_tokens
    if prompt_limit <= 0:
        raise ValueError("max_new_tokens must be smaller than model max seq")

    inputs = tokenizer.apply_chat_template(
        messages,
        tokenize=True,
        add_generation_prompt=True,
        enable_thinking=enable_thinking,
        truncation=True,
        max_length=prompt_limit,
        return_tensors="pt",
        return_dict=True,
    ).to("cuda")

    args = {
        "max_new_tokens": max_new_tokens,
        "use_cache": True,
        "repetition_penalty": repetition_penalty,
        "pad_token_id": tokenizer.pad_token_id or tokenizer.eos_token_id,
    }
    if temperature > 0:
        args.update(do_sample=True, temperature=temperature, top_p=top_p)
    else:
        args["do_sample"] = False

    prompt_tokens = inputs["input_ids"].shape[-1]
    with torch.inference_mode():
        outputs = model.generate(**inputs, **args)
    return tokenizer.decode(outputs[0, prompt_tokens:], skip_special_tokens=True).strip()
