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

| Script | Purpose | Use when |
|---|---|---|
| `script/eval/cpt/loss.py` | Forward NLL per CPT checkpoint on a valid split | CPT: verify loss actually dropped, spot per-checkpoint plateaus |
| `script/eval/sft/infer.py` | Generate predictions.jsonl from an SFT adapter + valid split | SFT: manual single-task inference |
| `script/eval/sft/gate.py` | Score predictions.jsonl: output shape + jac gates | SFT: turn predictions into pass-rate + per-class + per-sample diagnostic |
| `script/eval/sft/eval_batch.py` | Load model once, run infer+gate across a list of (task, ds) pairs | SFT: comparing one adapter across multiple tasks (~8× faster than a bash loop) |

## Typical flows

### CPT progress check
```bash
python script/eval/cpt/loss.py --run output/adapter/<cpt-run> --ds Nitin-10k-jac-functions
python script/eval/cpt/loss.py --base --ds Nitin-10k-jac-functions   # baseline reference
```
Writes `output/eval/cpt/<run>/loss-<ds>.json`. Compare `results[].mean_loss` across checkpoints.

### SFT single-adapter multi-task (recommended)
```bash
python script/eval/sft/eval_batch.py \
  --adapter output/adapter/<sft-run>/adapter \
  --limit 0                             # 0 = all valid records; use 100-500 for iteration
```
Runs infer + gate across all 4 tasks defined in `EVAL_SET` inside the script. Reports at `output/eval/<task>/<ds>/<tag>_<stamp>/report.json`.

### SFT one-off (manual)
```bash
python script/eval/sft/infer.py --task code_gen --ds opus-synth-v2 \
  --adapter output/adapter/<sft-run>/adapter --limit 100
python script/eval/sft/gate.py --pred output/eval/code_gen/opus-synth-v2/<tag>/predictions.jsonl
```

### Cross-adapter comparison
`eval_batch.py` can only load one model. For sweeping adapters, wrap it:
```bash
for a in output/adapter/*-sft-*/adapter; do
  python script/eval/sft/eval_batch.py --adapter "$a" --limit 300
done
```
Each iteration pays the ~2 min model-load cost.

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

## Known baseline numbers (Ornith-1.5-9B SFT stack, 2026-08-25)

Weighted overall: **71.0%** (2340 / 3294 records) — comparable to Jac-Model-Studio's SFT +25pt baseline of 72.6% on their 855-row holdout.

| Task | Records | Pass rate | Weakest class |
|---|---|---|---|
| code_completion | 1523 | 88.5% | (function only) |
| py2jac | 388 | 76.3% | osp 41.7% |
| code_gen | 460 | 54.6% | fullstack 38.2% |
| js2jac | 923 | 48.2% | fullstack 27.4% |

Adapter: `output/adapter/08-24_21-30-sft-qa-opus-synth-v2/adapter` (final SFT after code_completion → js2jac → py2jac → code_gen → qa stack).

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
