# Evaluation

How to measure whether a training run improved the model.

## The metric ladder

Adapted from Jac-Model-Studio's EVAL.md taxonomy (`../Jac-Model-Studio/EVAL.md`):

| Layer | Command | Metric name | Answers |
|---|---|---|---|
| 1. parse | `jac check --parse-only` | parse success | is it syntactically balanced? |
| 2. **check** | `jac check` | check success | does it type-check statically? |
| 3. run | `jac run` (no crash) | run success | does it execute without erroring? |
| 4. functional | `jac run` + expected output diff | functional pass | does the output match a reference? |
| 5. test | `jac test` | test pass | does it pass an authored test suite? |

**Where we sit today:**
- CPT eval → **loss** (proxy for Layer 0 fluency; not a pass/fail)
- SFT eval → **Layer 2 (check)** via `gate.py`; ladder can extend to Layer 3 (`--checks check,run`)
- Layer 4 blocked: no `expected_output` in any current SFT dataset (see "known gaps")

## Scripts

See `script/eval/README.md` for a decision tree ("I want X → run Y"). Layout:

```
script/eval/
  gate.py                    # scorer (shared)
  batch.py                   # multi-task runner (loads model once)
  infer/                     # producers of predictions.jsonl, one per backend
    adapter.py               # local HF/unsloth adapter
    openrouter.py            # any OpenRouter-hosted model
  compare/                   # post-hoc analysis of report.json / predictions.jsonl
    confmat.py               # per-sample confusion matrix
    taxonomy.py              # failure clustering by check_err
  probe/                     # intrinsic model analysis (no dataset scoring)
    svd_energy.py            # LoRA rank sizing
    cpt_loss.py              # forward NLL per CPT checkpoint
    adapter_viewer.ipynb     # interactive companion to svd_energy
```

## Typical flows

### CPT progress check
```bash
python script/eval/probe/cpt_loss.py --run output/adapter/<cpt-run> --ds Nitin-10k-jac-functions
python script/eval/probe/cpt_loss.py --base --ds Nitin-10k-jac-functions   # baseline reference
```
Writes `output/eval/cpt/<run>/loss-<ds>.json`. Compare `results[].mean_loss` across checkpoints.

### SFT single-adapter multi-task (recommended)
```bash
python script/eval/batch.py \
  --adapter output/adapter/<sft-run>/adapter \
  --limit 0                             # 0 = all valid records; use 100-500 for iteration
```
Runs infer + gate across all 4 tasks defined in `EVAL_SET` inside the script. Reports at `output/eval/<task>/<ds>/<tag>_<stamp>/report.json`.

### SFT one-off (manual)
```bash
python script/eval/infer/adapter.py --task code_gen --ds opus-synth-v2 \
  --adapter output/adapter/<sft-run>/adapter --limit 100
python script/eval/gate.py --pred output/eval/code_gen/opus-synth-v2/<tag>/predictions.jsonl
```

### Cross-adapter comparison
`batch.py` can only load one model. For sweeping adapters, wrap it:
```bash
for a in output/adapter/*-sft-*/adapter; do
  python script/eval/batch.py --adapter "$a" --limit 300
done
```
Each iteration pays the ~2 min model-load cost.

### OpenRouter (any hosted model)
Evaluate a hosted API model against the same tasks/splits, so `gate.py` and
`confmat.py` compare it directly to a local adapter.

```bash
export OPENROUTER_API_KEY=sk-or-...

python script/eval/infer/openrouter.py \
    --model anthropic/claude-3.5-sonnet \
    --task osp --ds Nitin-1k-osp \
    --limit 0 --workers 8

python script/eval/gate.py \
    --pred output/eval/osp/Nitin-1k-osp/anthropic_claude-3.5-sonnet_<stamp>/predictions.jsonl
```

Output lands at `output/eval/<task>/<ds>/<model-slug>_<stamp>/`, same shape as
adapter runs — so a confusion matrix works as-is:

```bash
python script/eval/compare/confmat.py \
    --a output/eval/osp/Nitin-1k-osp/<v1.1-adapter>_<stamp>/report.json \
    --b output/eval/osp/Nitin-1k-osp/anthropic_claude-3.5-sonnet_<stamp>/report.json \
    --label-a v1.1 --label-b sonnet
```

Failed API calls (post-retry) land in `prediction` as `"__ERROR__ …"` — gate
counts them as `no_output`. Grep the string to isolate infra failures from
model failures.

### LoRA rank sizing
```bash
python script/eval/probe/svd_energy.py --adapter output/adapter/<run>/adapter
```
Reports median/p90 of the smallest rank capturing 50/80/90/95/99% of the
adapter's ΔW = B@A energy, per module and overall. A median 80%-energy rank
well below `r_max` is evidence the training rank is oversized for the task.

## Output shape

`report.json` from `gate.py`:

```jsonc
{
  "pred_file": ".../predictions.jsonl",
  "checks":    ["check"],                        // ladder order
  "overall":   {
    "n": 460, "has_block": 407, "wrong_fence": 2, "no_output": 51,
    "check_pass": 251
  },
  "by_class":  {
    "function":  {"n": 166, "has_block": 149, "wrong_fence": 0, "no_output": 17, "check_pass": 105},
    "graph":     { ... },
    "osp":       { ... },
    "fullstack": { ... }
  },
  "samples":   [ /* one entry per prediction */
    {
      "id": 3, "class": "function", "kind": "has_block",
      "prediction": "<full model output, un-truncated>",
      "check_ok": false,
      "check_err": "<full jac check stderr, un-truncated>"
    },
    ...
  ]
}
```

### Output kinds (from `utils/jac_block.classify_output`)

| Kind | Meaning | Counts toward `check_pass`? |
|---|---|---|
| `has_block` | ≥1 well-formed ```jac ... ``` fence | Yes (gate runs) |
| `wrong_fence` | Fenced block but not `jac` (e.g. ` ```python`) | No (gate skipped, still fails toward `n`) |
| `no_output` | No fenced block at all — pure prose or malformed | No |

`check_pass` denominator is always `n`, so `wrong_fence` + `no_output` count as failures. The three-way split lets you separate "model can't write Jac" from "model wrote code but forgot/mislabelled the fence" from "model wrote prose only."

### Per-sample diagnostics
`samples[].prediction` and `samples[].check_err` are **un-truncated** — `report.json` is self-contained for debug. Grep straight through it:

```bash
jq '.samples[] | select(.check_ok==false) | {id, class, err: .check_err[:200]}' report.json | less
```

## Baseline results

Frozen per-adapter numbers live under `output/eval/`, not in this doc. See:

- `output/eval/report-v1-baseline.md` — v1 SFT stack (2026-08-25).

Add a new `report-<tag>.md` there whenever an eval milestone is worth recording, rather than editing this manual.

## Reference: Jac-Model-Studio comparison

They report a single `functional pass rate` — Layer 3 in taxonomy (`jac run`), not the Layer 4 they describe in `EVAL.md`. Their implementation:

- Fixed holdout: 855 code-graded rows (from 1428, dropping 573 `prose_lexical` non-code rows)
- Batched generation: `mlx_lm.batch_generate` with batch_size=32
- One metric collapse (all classes into single `runs_pct`)

Speed: ~15 min per checkpoint on MLX (batched).
Ours: ~2 hr per 855 rows on RTX 5080 (sequential). ~8× slower — the gap is batching.

## Known gaps

1. **Layer 4 (behavioral) not measured** — no dataset ships `expected_output`. Studio's `conversion.jsonl` (150 rows) is the only exception and covers only Python→Jac function conversion. See `docs/idea/JacPlayground.md` for the plan to build a hand-curated behavioral task bank.
2. **No jac_run in gate.py by default** — `--checks check,run` runs both, but adds ~5 sec/sample. Not worth for iteration loops; use for milestone eval.
3. **`prose_lexical` (qa) records not filtered** — currently qa records with no expected code get `no_output` and count as failures. That's wrong for qa evaluation. Either exclude qa from `gate.py` or tag records with `expects_code: false`.
4. **Deprecated Jac syntax in training data** — `cl { ... }` and `def:pub` are common failure modes on fullstack; drives most of the `check_fail` in that class. Fix: run `jac fix placement` on training data before regenerating SFT jsonl.
5. **Rank-128 adapters carrying CPT shape** — SFT hyperparams (`--rank 64`, SFT `TARGET_MODULE`) silently ignored when SFT is trained on top of a CPT adapter (see README "Continue training"). Not a bug, but larger checkpoints. Merge CPT first if you want clean SFT-shape adapters.

## Reading a report — what to look at, in order

1. **`overall.check_pass / n`** — the headline.
2. **`overall.wrong_fence + no_output`** — if > 5%, model has a **format** problem, not a Jac problem. Fix prompt template before blaming training.
3. **`by_class.fullstack.check_pass`** — always weakest; if it's collapsing further, `cl` deprecation is likely re-injecting.
4. **`by_class.function.check_pass`** — should track code_completion pass rate. If function class collapses in code_gen but code_completion holds, cross-task interference is happening.
5. **Random sample of `samples[].check_err`** — five failures per class tells you the actual error taxonomy fast.
