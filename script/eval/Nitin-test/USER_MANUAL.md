# Nitin function-eval-v1 — User Manual

A self-contained evaluation suite for Jac code generation. Given an adapter,
it produces model completions, grades them against hidden Jac tests, and
renders a report + pass-rate chart.

---

## 1. What the eval measures

Each problem in `data/function/v1/{public,private}/{dev,test}.jsonl` is one
of two tasks:

- **completion** — model receives a Jac prefix (docstring + signature +
  partial body) and must emit the rest of the function.
- **translation** — model receives a Python reference and must produce a
  functionally equivalent Jac implementation.

The grader concatenates `prefix + model_completion + suffix`, runs the
private `test_blocks` against it with the pinned Jac toolchain, and records
per-testcase pass/fail.

### Metrics

| metric | definition |
|---|---|
| **pass@1 / AC rate** | % of problems where every hidden testcase passes |
| **compile rate** | % of problems whose assembled source passes `jac check` |
| **AC-among-compile** | AC ÷ compile — how often compiling code is correct |
| **hidden-testcase pass rate** | Σ passed_tests ÷ Σ total_tests across problems |
| **strict score** | testcase pass rate with compile/extract failures counted as 0 |
| **partial-pass buckets** | histogram of per-problem testcase pass fraction: 1–20% / 21–40% / 41–60% / 61–80% / 81–99% |
| **tool failure** | jac-toolchain bugs (bytecode / native-limit / infra) — not the model's fault |
| **fair pass@1** | AC ÷ (n − tool_failures) — pass@1 excluding jac bugs |
| **reference-valid rate** | % of problems where the *reference* solution itself passes; anything below 100% is a dataset caveat |

### Failure taxonomy (`build_taxonomy.py`)

- `jac_bytecode_bug` — E5043 Store/Load mislabel (compiler false positive)
- `jac_native_limit` — E5090/E5092… native-lowering not-yet-supported paths
- `jac_infra` — pg / pg_ctl environment issues
- `model_check_fail` — E1xxx type / return-path / operator errors on model code
- `model_semantic` — compiled and ran, but tests failed
- `model_extract_fail` — no `jac` block or fence in model output

---

## 2. Input format

**Public prompt row** (`data/function/v1/public/<split>.jsonl`):
```json
{"id": "...", "task": "completion" | "translation", "prompt": "...",
 "prefix": "...", "entrypoint": "...", "cluster_id": "...", ...}
```

**Private problem row** (`data/function/v1/private/<split>.jsonl`) — adds
`test_blocks` (hidden Jac `test` blocks), `reference_completion`,
`idiomatic_jac`, `required_features`, `forbidden_features`.

Split sizes: dev = 400, test = 1000 (500 completion + 500 translation).

---

## 3. Pipeline & CLI

```
public/<split>.jsonl ─▶ run_eval.py ─▶ samples.jsonl
                                    ─▶ (graders/eval_jac.py) ─▶ results.jsonl
                                    ─▶ summary.json
results.jsonl + samples.jsonl + private ─▶ build_taxonomy.py ─▶ taxonomy.jsonl
results.jsonl + refs runs               ─▶ report/build_report.py ─▶ report.md
results.jsonl + taxonomy.jsonl          ─▶ plot_passrate.py ─▶ passrate.png
```

Env: run under the `tornith` conda env (`matplotlib`, `torch`, etc. live
there). The project also has a top-level env; matplotlib is only in
`tornith`, so plotting must use `/home/imrui/miniforge3/envs/tornith/bin/python`.

### 3a. Generate + grade — `run_eval.py`

```bash
python script/eval/Nitin-test/run_eval.py \
  --adapter output/adapter/<run>/sft/adapter \
  --split test              # dev | test
  --k 1                     # pass@k, comma-separated e.g. "1,5"
  --workers 4               # grader workers
  --limit 0                 # 0 = full split; N = first N problems
  --timeout 300             # per-sample grader timeout (s)
```

Outputs land in `out/<tag>_<split>_<MM-DD_HH-MM>/`:
- `samples.jsonl`  — model completions
- `results.jsonl`  — per-sample verdicts, includes `per_test`
- `summary.json`   — status counts + pass@k

### 3b. Reference-solution baseline — `wash_refs.py`

Grades the dataset's own reference solutions on the same toolchain, so the
report can flag problems whose *reference* fails ("reference-valid rate").
Run once per split × reference field.

```bash
python script/eval/Nitin-test/wash_refs.py \
  --split test --field reference_completion --workers 4      # → completion refs
python script/eval/Nitin-test/wash_refs.py \
  --split test --field idiomatic_jac       --workers 4       # → translation refs
```

### 3c. Failure taxonomy — `build_taxonomy.py`

```bash
python script/eval/Nitin-test/build_taxonomy.py \
  --results  out/<run>/results.jsonl \
  --samples  out/<run>/samples.jsonl \
  --problems data/function/v1/private/<split>.jsonl \
  --out-dir  out/<run>/
```
Writes `taxonomy.jsonl` (one row per failure) and `taxonomy_counts.json`.
Prints raw and fair pass@1.

### 3d. Report — `report/build_report.py`

```bash
python -m script.eval.Nitin-test.report.build_report \
  --model-results   out/<model_run>/results.jsonl \
  --refs-completion out/refs_reference_completion_test_*/results.jsonl \
  --refs-translation out/refs_idiomatic_jac_test_*/results.jsonl \
  --public          data/function/v1/public/test.jsonl \
  --out             out/report_<tag>/
```
Writes `report.md`, `summary.json`, `per_sample.jsonl`.

### 3e. Pass-rate chart — `plot_passrate.py`

```bash
/home/imrui/miniforge3/envs/tornith/bin/python \
  script/eval/Nitin-test/plot_passrate.py \
  --results  out/<run>/results.jsonl \
  --taxonomy out/<run>/taxonomy.jsonl \
  --out      out/<run>/passrate.png \
  --title    "Testcase pass-rate distribution — <tag>" \
  --subtitle "<run-id>"
```
Nine buckets: Tool error, Compile fail, 0% (all wrong), 1–20%, 21–40%,
41–60%, 61–80%, 81–99%, 100% AC. When results span multiple tasks
(completion + translation), the chart automatically renders one panel per
task plus an overall panel; force with `--split-by-task` /
`--no-split-by-task`. Note: a sample is only in "Tool error" if `per_test`
is empty; jac-tool errors with a per_test array fall into 0% or partial —
check `taxonomy_counts.json` for the raw counts.

---

## 4. Expected outputs

Per run directory `out/<tag>_<split>_<stamp>/`:

```
samples.jsonl          # {problem_id, sample_id, completion, ...}
results.jsonl          # {problem_id, status, per_test:[{name,passed,...}], error, ...}
summary.json           # {n_samples, status_counts, pass_at_1}
taxonomy.jsonl         # (after build_taxonomy) failure category per failed row
taxonomy_counts.json
passrate.png           # (after plot_passrate) 9-bucket histogram
```

Per report directory `out/report_<tag>/`:

```
report.md              # markdown tables per task (completion/translation/overall)
summary.json           # machine-readable form
per_sample.jsonl       # attribution + counts per model sample
```

### Sample report (from `sft_test_09-13_17-28`, n = 1000)

| metric | overall |
|---|---|
| compile rate | 81.1% |
| pass@1       | 49.8% |
| testcase pass rate | 83.2% |
| tool failure | 23 |

Partial buckets (overall): 1–20% = 44, 21–40% = 37, 41–60% = 27,
61–80% = 41, 81–99% = 65.

---

## 5. Typical end-to-end run

```bash
TAG=sft_v12
ADAPTER=output/adapter/0910-trueseq-r64/sft/adapter

# 1. generate + grade
python script/eval/Nitin-test/run_eval.py \
  --adapter $ADAPTER --split test --workers 4
RUN=$(ls -td script/eval/Nitin-test/out/${TAG}_test_* | head -1)

# 2. reference baselines (once per split — reuse across models)
python script/eval/Nitin-test/wash_refs.py --split test --field reference_completion --workers 4
python script/eval/Nitin-test/wash_refs.py --split test --field idiomatic_jac       --workers 4

# 3. taxonomy
python script/eval/Nitin-test/build_taxonomy.py \
  --results $RUN/results.jsonl --samples $RUN/samples.jsonl \
  --problems script/eval/Nitin-test/data/function/v1/private/test.jsonl \
  --out-dir $RUN/

# 4. report
python -m script.eval.Nitin-test.report.build_report \
  --model-results $RUN/results.jsonl \
  --refs-completion  script/eval/Nitin-test/out/refs_reference_completion_test_*/results.jsonl \
  --refs-translation script/eval/Nitin-test/out/refs_idiomatic_jac_test_*/results.jsonl \
  --public script/eval/Nitin-test/data/function/v1/public/test.jsonl \
  --out $RUN/report/

# 5. chart
/home/imrui/miniforge3/envs/tornith/bin/python \
  script/eval/Nitin-test/plot_passrate.py \
  --results $RUN/results.jsonl --taxonomy $RUN/taxonomy.jsonl \
  --out $RUN/passrate.png \
  --title "Testcase pass-rate — $TAG" --subtitle "$(basename $RUN)"
```

---

## 6. Gotchas

- **Never train on `private/`** — hidden tests and reference solutions
  live there.
- Prompts are continuation-style, no chat fences. `run_eval.py` strips a
  leading ```` ```jac ```` block if the model emits one anyway.
- Instruct-tuned models sometimes echo the visible prefix back;
  `strip_echoed_prefix` removes it before grading (otherwise duplicate
  signature → compile fail).
- Adapter is auto-merged in RAM by `utils.model.load_model()` — no disk
  merge needed.
- Reference-valid rate below 100% (currently 98.2%) means a small number
  of dataset problems have references that fail under the pinned Jac
  toolchain; treat those as noise, not model errors.
- `plot_passrate.py`'s "Tool error" bucket only catches jac bugs that
  prevented tests from running. Jac bugs that produced a failing `per_test`
  array show up as 0% / partial — see `taxonomy_counts.json` for the
  toolchain-error count.
