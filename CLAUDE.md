# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

JacCoder is a training workspace for LoRA-tuning LLMs (`ornith-ai/Ornith-1.5-9B`, a Qwen-family VLM wrapper, and `unsloth/Qwen3-Coder-30B-A3B-Instruct`, a MoE model) on the Jac language, built on Unsloth. It is a collection of runnable Python scripts, not an installable package: there is no build step, linter, or test suite. Everything under `script/` needs an NVIDIA GPU and the pinned Unsloth/Transformers/TRL stack, except the dataset producers and `graders/`.

`docs/CONVENTION.md` is the authoritative style and layout guide for all Python under `script/`. Read it before adding or restructuring code.

## Environment

```bash
bash setup_env.sh [ENV_NAME]     # mamba env, Python 3.12, uv with --torch-backend=auto
TORCH_BACKEND=cu130 bash setup_env.sh jacllm   # CUDA 13.2 drivers: auto picks cu132 and silently installs CPU torch
mamba activate <ENV_NAME>
```

- Pins live in `requirement.txt`. Never pin torch, torchvision, triton, or xformers there; `setup_env.sh` lets uv choose builds that match the GPU.
- The `jac` CLI must be on PATH for eval. `script/utils/jac_cli.py` is the only place that should shell out to `jac`. The pinned version (0.36.1) is not on PyPI; see `docs/CLOUD_GPU.md` for installing it.
- On a rented GPU (RunPod), read `docs/CLOUD_GPU.md` first: what survives a restart, HF token scopes, prefetching weights from the network volume, disk budget.

## Common commands

Run everything from the repo root.

```bash
# Multi-dataset training (preferred): a YAML/py recipe drives the stage, hyperparams and dataset mix
python script/train/train.py --recipe script/train/recipe/<name>.yaml [--adapter <dir>]
python script/train/train.py --resume <run>/checkpoint-N     # recipe comes from <run>/recipe.<ext>
python script/train/train.py --recipe script/train/recipe/dev/smoke_sft.yaml     # smoke test

# Single-dataset training (in-file config block + CLI overrides)
python script/train/cpt.py --ds <ds> [--steps N]
python script/train/sft.py --task js2jac --ds <ds> --epochs 3 --lr 2e-4

# Build a dataset split from dataset/raw/... (edit the Setting block first)
python script/dataset/sft/<task>.py
python script/dataset/cpt/{file,repo}.py

# SFT eval: infer + `jac check` gate across EVAL_SET tasks
python script/eval/batch.py --adapter output/adapter/<run>/adapter --limit 100 [--tasks osp] [--checks check,run]
python script/eval/gate.py --pred <predictions.jsonl>

# Function-level test-suite eval (vendored Nitin harness)
python script/eval/Nitin-test/run_eval.py --adapter <adapter> --split dev --limit 20

# The only unit tests (plain asserts, no pytest)
python script/eval/Nitin-test/report/test_attribute.py

tensorboard --logdir output/adapter/<run>/runs
```

`script/eval/README.md` maps each eval task to the command that runs it. `script/eval/Nitin-test/USER_MANUAL.md` covers the full generate → wash_refs → taxonomy → report → plot pipeline.

## Architecture

**Data flow:** `dataset/raw/` (gitignored) → a producer in `script/dataset/{cpt,sft}/` → checked-in `dataset/cpt/<ds>/train.jsonl` or `dataset/sft/<task>/<ds>/{train,valid}.jsonl`, with a `statistic.json` next to each → training → `output/adapter/<MM-DD_HH-MM>-<name>/` (checkpoints, `runs/`, `adapter/`) → eval → `output/eval/<task>/<ds>/<tag>_<stamp>/`.

**Dataset producers** all have the same shape: `# Setting` / `# Functions` / `# Run` banners, a task-specific `build_record()`, then the shared `dataset/pipeline.py` (`load_prompts`, `split_and_write`, `report`). Prompts come from `script/dataset/template/prompt_template.json`. Records are `{"text": ...}` for CPT or `{"messages": [...]}` for SFT. Both carry a standardized `meta` block (`source, format, class, fp`, plus `task_type` for SFT), where `class` comes from `utils/classifier.py`.

**Training:** `cpt.py` and `sft.py` each expose `default_config()` and `run_cpt(cfg, train_ds, eval_ds)` / `run_sft(...)`. When run as scripts, their `__main__` blocks handle single-dataset runs. `train.py` loads a recipe, `mixer.build_from_recipe()` resolves the dataset entries and mixes them (`concat` / `interleave` / sequential), and then the same runner functions are called in-process, never through a subprocess. The recipe schema is strict: unknown keys are rejected, and it is documented in `script/train/recipe/README.md`. Hyperparameter keys map to `default_config()` fields. Shared training helpers live in `train/utils.py` (`save_adapter` optionally pushes to HF).

**Eval:** backends in `eval/infer/` (`adapter.py` for local HF/Unsloth models, `openrouter.py` for hosted models or any OpenAI-compatible server via `--base-url`, e.g. a local `llama-server` serving a GGUF export) all write `predictions.jsonl` in one schema. `gate.py` scores it along the ladder parse → check → run (it short-circuits at the first failure) and writes `report.json`. `compare/` and `probe/` work on those outputs or on adapter weights, so a new backend only needs to write the same predictions schema. `script/eval/Nitin-test/` is a separate vendored harness that grades against hidden unit tests; see `PROVENANCE.md` there before changing vendored files.

**Model loading:** `utils/model.py:load_model` is the one loader used by inference and eval. It restores `config.architectures` (an Unsloth text-only VLM bug) and merges adapters in RAM, except MoE adapters with LoRA on expert parameters (`target_parameters`), which stay attached because merging them into the 4-bit base silently yields the base model.

## Gotchas

- **`text_only=True` must match between training and loading.** Ornith is a processor-wrapped VLM. If an adapter is trained without `text_only`, its keys include `.language_model.`, they silently fail to match at load time, and eval quietly runs the base model (every checkpoint then shows identical loss). See `docs/DEBUG.md`.
- `--resume` (a `checkpoint-N/` directory with full trainer state) and `--adapter` (weights only, fresh optimizer) are mutually exclusive. `--resume` loads the model from the checkpoint (LoRA shape included) and the recipe from `<run>/recipe.<ext>`. A loaded adapter freezes the LoRA shape (`--rank`, target modules, alpha, rslora). To change the shape, merge first with `script/merge_lora.py` and retrain on the merged base.
- In-training eval (`DO_EVAL`) is off because it OOMs on 16GB. Use `script/eval/probe/cpt_loss.py` or `batch.py` after training. When loading several models in one loop, call `gc.collect()` and `torch.cuda.ipc_collect()`, not just `empty_cache()`.
- With `interleave` + `all_exhausted`, small datasets can be resampled many times (see `docs/CONCERN.md`).
- Never train on `script/eval/Nitin-test/data/**/private/`. It holds the hidden tests and reference solutions.
- Adapters trained in sequence without a merge share the same LoRA subspace (see `SPIKE.md`). Keep this in mind when you interpret multi-stage results.
- **Merging a MoE expert-LoRA adapter into the 4-bit base gives the base model.** On Qwen3-Coder-30B-A3B, `merge_and_unload()` generated exactly like the untrained model; `load_model` keeps these adapters unmerged. For exports (GGUF, deployment), merge into 16-bit with `save_pretrained_merged(..., "merged_16bit")` and check a training prompt still gets the trained answer. See `docs/DEBUG.md`.
- **`mixing.strategy: sequential` relies on `train_sampling="sequential"`** (set by `mixer.py`); HF `Trainer`'s default random sampler would reshuffle the curriculum. Runs before commit `31da523` were effectively concat.
- **Packed SFT builds labels per conversation** (`sft.py:tokenize_with_assistant_mask`). Don't reintroduce `train_on_responses_only` on packed data: it trains the next conversation's system prompt.
