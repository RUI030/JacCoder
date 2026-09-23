# Debug log

## Model weights left in GPU after closing the notebook

Open the notebook and restart the kernel.


## 1. Layer name mismatch ("missing adapter keys" warning)

- **Cause:** training ran without `text_only=True`, so Unsloth kept Ornith's
  processor VLM wrapper and the adapter was saved with a `.language_model.`
  level in its keys (`base_model.model.model.language_model.layers.N...`).
  Eval / inference in `utils/model.py` always uses `text_only=True`, so Unsloth
  strips the wrapper and makes `language_model` the root; PEFT then looks for
  `base_model.model.model.layers.N...`, finds nothing, and silently loads an
  empty adapter. Every checkpoint shows the same loss (the base model's).
- **Dead end:** passing `text_only=False` in `loss.py` to match the training
  side runs into Unsloth issue #1436, an unfixed VLM text-only bug (the
  processor treats the input as an image and PIL crashes). The only real fix
  is on the training side.


## 2. `loss.py` checkpoint loop OOMs

- **Cause:** each checkpoint loads a new model, and
  `del model, tokenizer; torch.cuda.empty_cache()` is not enough. Python
  reference cycles (trainer / PEFT wrapper / hooks pointing at each other)
  keep the old model alive until GC runs, so the previous 8GB is still in VRAM
  when the next checkpoint loads.
- **Fix:**

  ```python
  import gc
  del model, tokenizer
  gc.collect()              # break the reference cycles
  torch.cuda.empty_cache()
  torch.cuda.ipc_collect()  # release IPC handles
  ```

- **Related (CPT eval OOM):** `eval_strategy="steps"` during training OOMs for
  a different reason: accelerate/HF upcasts bf16 logits to fp32. Not fixed at
  the root; `DO_EVAL=False` avoids it, and `loss.py`'s forward-only path is
  used for eval instead.


## 3. MoE adapter merged into 4-bit == base model (Qwen3-Coder-30B-A3B)

- **Symptom:** after SFT, a small `batch.py` eval passed 0–20%, and code_gen
  prompts (which never say "Jac") were answered in React/JSX or Python, even
  though training loss was normal (code_gen down to 0.40).
- **Cause:** `utils/model.py:load_model` always called `merge_and_unload()`.
  This MoE adapter puts LoRA on fused expert parameters (`target_parameters`
  in `adapter_config.json`); merged into the 4-bit base, it generates exactly
  like the base model. The adapter's effect disappears with no warning.
- **How it was confirmed:** the same training prompt in three modes. Adapter
  unmerged: ```` ```jac cl { def:pub Counter() ... ````, matching the training
  answer. `disable_adapter()`: React. Merged: React, identical to the base.
- **Fix:** `load_model` keeps adapters with `target_parameters` unmerged
  (commit `c44edd6`). Ornith adapters still merge (they need it to avoid
  mis-attaching). For exports (GGUF / deployment), merge into 16-bit with
  `save_pretrained_merged(..., "merged_16bit")`, never into the 4-bit model,
  and verify on a training prompt.
- **Also affected:** the earlier CPT-adapter inference test (which produced
  invalid syntax like `func factorial`) went through the same merge path, so
  what it showed was the base model.


## 4. Packed SFT trained the next conversation's system prompt

- **Symptom:** in a `packing: true` smoke run, each packed sequence had about
  2 × conversations − 1 trained spans; the extra spans started right after
  `<|im_start|>` with `system\n...`.
- **Cause:** `train_on_responses_only` runs after packing and treats the whole
  packed sequence as one multi-turn chat: it unmasks from an assistant marker
  to the next user marker, and the next conversation's system prompt sits in
  between. Every dataset with a system prompt is affected (code_completion,
  js2jac, farm, scaffold2impl: about 60% of samples).
- **Dead end:** pre-tokenizing with an `assistant_masks` column. For
  pre-tokenized data Unsloth keeps only `input_ids` (plus `labels`) and swaps
  in a `DataCollatorForLanguageModeling` that ignores the mask, so the whole
  sequence was trained (loss jumped from ~0.2 to 0.5–0.75).
- **Fix:** `sft.py` tokenizes each conversation before packing, with `labels`
  kept only on assistant turns (content + `<|im_end|>\n`), carries them
  through packing as the `labels` column, and skips `train_on_responses_only`
  (commit `4599fa7`). Verified: trained spans == assistant turns, no system or
  user tokens trained, `position_ids` restart at 0 per conversation.


## 5. `sequential` mixing was actually shuffled

- **Symptom:** none visible; sequential and concat runs just didn't differ.
- **Cause:** `mixer.py`'s sequential strategy concatenates datasets in order,
  but HF `Trainer` defaults to a `RandomSampler` and reshuffles the whole
  dataset every epoch.
- **Fix:** the mixer sets `train_sampling="sequential"` for sequential
  recipes, and `cpt.py` / `sft.py` pass it as `train_sampling_strategy`
  (commit `31da523`). Trueseq runs before that (e.g. `0910-trueseq-r64`) were
  effectively concat.
