# Training recipes

A recipe is one file that describes a training run end-to-end: base model,
adapter, hyperparameters, and how to mix multiple datasets into the training
stream. `train.py` reads the recipe, `mixer.py` builds the mixed HF dataset,
and `run_cpt` / `run_sft` in `cpt.py` / `sft.py` do the training.

For a single-dataset run, keep using `cpt.py` / `sft.py` with their own CLI
flags. Recipes exist for the multi-dataset case.

## Running

```bash
python script/train/train.py --recipe script/train/recipe/base_sft_v1.yaml
python script/train/train.py --recipe recipe.py --adapter path/to/prev
```

`--adapter` overrides `recipe.adapter`, `--resume` overrides
`recipe.resume_from`. They're mutually exclusive with each other.

## Format

Recipes are YAML (`.yaml` / `.yml`) or Python (`.py` — must export
`RECIPE = {...}` at module level). Both parse to the same dict shape.
The schema is strict: unknown keys are rejected instead of silently falling
back to a default. Start from one of the checked-in recipes when creating a
new one.

```yaml
recipe:
  name: base_sft_v1              # used to name output/adapter/<timestamp>-<name>/
  stage: sft                     # cpt | sft
  base_model: ornith-ai/Ornith-1.5-9B
  adapter: ""                    # optional continue-from adapter path
  hf_repo: ""                    # optional exact repo id; default: <hf_org>/JacLLM-<model-name>
  seed: 3407
  max_seq_length: 4096
  load_in_4bit: true
  text_only: true
  chat_template: qwen-2.5        # sft only

hyperparams:
  epochs: 1
  batch_size: 1
  grad_acc: 10
  lr: 2.0e-4
  lora_rank: 64
  lora_alpha: 16
  # ...any other field in default_config() of cpt.py / sft.py

mixing:
  strategy: interleave           # concat | interleave
  stopping: all_exhausted        # interleave only: first_exhausted | all_exhausted

datasets:
  - task: py2jac                 # required for sft; ignored for cpt
    name: opus-synth-v2          # str | list | "*" (or omit) for all names under task
    split: train                 # default "train"; can also be a list
    weight: 0.20                 # interleave only
    repeat: 1                    # concat oversampling (default 1)
```

## Dataset resolution

Given `stage=sft`:

| entry | resolves to |
|---|---|
| `task=py2jac, name=opus-synth-v2` | `dataset/sft/py2jac/opus-synth-v2/train.jsonl` |
| `task=osp, name=[Nitin-1k-osp]` | one dir |
| `task=js2jac` (no `name`) | every subdir under `dataset/sft/js2jac/` |
| `split=[train, valid]` | both jsonls concatenated into one HF split |

Missing dataset directories or splits are skipped with a visible warning. If
all requested training data is missing, the run stops before loading a model.

Given `stage=cpt`:

| entry | resolves to |
|---|---|
| `name=Nitin-9k-py2jac-idiom` | `dataset/cpt/Nitin-9k-py2jac-idiom/train.jsonl` |
| no `name` | every subdir under `dataset/cpt/` |

## Mixing strategies

**concat** — pack all rows into one dataset, then shuffle. `repeat: 2` in a
dataset entry duplicates that dataset K times before concat (poor-man's
weighting). Every row is seen once per epoch × repeat.

**interleave** — at each training step, sample from a dataset according to
`weight` (normalized to a probability). Small datasets loop when
`stopping: all_exhausted` (default). Every `[[datasets]]` entry needs a
positive `weight`.

Rule of thumb: prefer `concat` when dataset sizes are close and you want each
row seen once; use `interleave` to actively control the ratio (e.g., "farm is
2k rows but I want it at 20% of the mix").

## Overrides

Command-line flags override the recipe:

```
--adapter <path>   # continue from adapter (mutex with --resume)
--resume <ckpt>    # resume training state (mutex with --adapter)
```

## Output

Runs land in `output/adapter/<MM-DD_HH-MM>-<recipe.name>/`. That directory
holds checkpoints, `runs/` (TensorBoard), and `adapter/` (or `merged/` if
`recipe.merge=true`).
