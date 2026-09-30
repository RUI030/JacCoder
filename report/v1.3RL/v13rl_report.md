# v1.3 RL - GRPO spike
> does GRPO on test-graded Jac function tasks improve the v1.3 SFT model?

Base `ornith-ai/Ornith-1.5-9B` + the v1.3-A SFT adapter (`output/adapter/0926-v13-A/sft`, arm A
of the [v1.3 report](../v1.3/v13_report.md)), then GRPO on its LoRA. Trained 2026-09-30.

## 1. Tasks

`dataset/rl/functions/spike-sample-20`: 20 hand-written single-function tasks (strings, lists,
dicts, recursion, simple algorithms). Each task has a request with public examples and a starter
file. It is graded by 5–7 hidden tests whose inputs differ from the examples; there are 109 hidden
tests in total. The tasks are new, not taken from Nitin-test.

| split | tasks | easy | medium | used for |
|---|---:|---:|---:|---|
| train | 14 | 9 | 5 | GRPO rollouts |
| dev | 3 | 2 | 1 | model choice, reported below |
| test | 3 | 2 | 1 | not evaluated yet |

## 2. Setup

- **Reward:** 0 if the answer is not exactly one ```` ```jac ```` block, fails `jac check`, times out
  (20 s) or goes over the memory cap (3 GB); otherwise hidden tests passed / total.
- **GRPO:** 8 completions per task, 2 tasks per update (16 completions), temperature 0.8, max 512
  new tokens, lr 5e-6, `dapo` loss, token-level importance sampling, no KL (`beta 0`), thinking off.
- **Length:** 50 steps ≈ 7 epochs over the 14 train tasks, 4 h 32 m on an RTX 5080
  (~327 s/step, ~98% of it generation).
- **Baseline choice:** v1.3-A over v1.3-B. On the train split both had 12/14 tasks with mixed
  results, but A's reward varied on 14/14 tasks (B: 13/14). B's CPT also saw extra OSP data.

Recipe: `script/train/recipe/0930-grpo-functions-spike/grpo.yaml`. Run:
`output/adapter/0930-grpo-functions-spike/grpo/`.

## 3. Results

`script/eval/rl/run_eval.py`, 8 samples per task, temperature 0.8, max 512 new tokens, the same
prompts for both models.

- **pass@k:** every hidden test passes, in at least one of k samples; unbiased estimator, averaged
  over tasks.
- **Test cases:** hidden tests passed / total over all samples; a sample with no code counts as 0.
- **Easy / medium:** samples of that difficulty that pass every hidden test.

**Train split** (112 samples per model)

| | pass@1 | pass@8 | compiles | test cases | easy | medium |
|---|---:|---:|---:|---:|---:|---:|
| v1.3-A SFT (baseline) | 37.5% | 85.7% | 90.2% | 67.4% | 41.7% (30/72) | 30.0% (12/40) |
| **GRPO** | **50.9%** | **92.9%** | **96.4%** | **77.4%** | **62.5%** (45/72) | 30.0% (12/40) |

**Dev split** (24 samples per model)

| | pass@1 | pass@8 | compiles | test cases | easy | medium |
|---|---:|---:|---:|---:|---:|---:|
| v1.3-A SFT (baseline) | 25.0% | 66.7% | 83.3% | 51.7% | 18.8% (3/16) | 37.5% (3/8) |
| **GRPO** | **45.8%** | **100%** | 83.3% | **60.8%** | **37.5%** (6/16) | **62.5%** (5/8) |

![GRPO training curve](image/grpo_train_curve.png)

**Train passes per task** (out of 8)

| task | difficulty | baseline | GRPO |
|---|---|---:|---:|
| binary_search | easy | 1 | **8** |
| word_frequency | easy | 4 | **7** |
| balanced_brackets | easy | 0 | **3** |
| rle_encode | easy | 5 | **7** |
| rotate_matrix | easy | 0 | **1** |
| valid_ipv4 | easy | 7 | 7 |
| two_sum | easy | 6 | 6 |
| caesar_shift | easy | 4 | 4 |
| roman_to_int | easy | 3 | 2 |
| eval_rpn | medium | 3 | **5** |
| merge_intervals | medium | 4 | **5** |
| group_anagrams | medium | 1 | 1 |
| count_islands | medium | 1 | 1 |
| dotted_keys | medium | 3 | 0 |

## 4. Findings

1. **GRPO helps on the tasks it trained on, but only the easy ones.** Easy full passes go from
   30 to 45 of 72; medium stays at 12 of 40. Medium test cases barely move (57.1% → 59.8%,
   against 73.0% → 87.0% for easy).
2. **Medium is reshuffled, not improved.** eval_rpn and merge_intervals gain 3 passes between
   them, while dotted_keys drops from 3 to 0. roman_to_int (easy) also drops by 1.
3. **Dev improves too, but it proves little.** Dev has 3 tasks and 24 samples, so one more correct
   sample moves pass@1 by about 4 pp. The GRPO checkpoint at step 25 scored the same as the
   baseline on dev (25.0% pass@1).
4. **Training signal holds up, then starts to thin out.** Every group had mixed rewards until
   step 38. After that, 10–15% of groups were all-correct, so the easy tasks begin to saturate.
5. **No reward hacking found.** Across 774 graded rollouts there were no forbidden imports, own
   test blocks or `::py::` escapes. One new behaviour on dev int_to_roman: 4 of 8 GRPO answers
   list numerals as a lookup table until they hit the 512-token cap, and score 0.

**Conclusion:** the reward works and moves the model on easy function tasks. It does not yet show
gains on medium tasks or on unseen tasks, because there are too few of them to measure.

## Notes

- **Test split not run.** Both models can still be evaluated on it once
  (`run_eval.py --split test`).
- **Next:** more tasks, especially medium and harder ones, and dev/test sets of tens of tasks.
  Then a longer run; generation speed limits that today (Ornith's linear-attention fast-path
  kernels are not installed).
- Not comparable to the Nitin function-suite numbers in the v1.3 report (different problems,
  samples and grader).
- Full log: `logs/rl_overnight.md`. Eval outputs: `output/eval/rl/functions/spike-sample-20/`.
  Rollouts: `output/adapter/0930-grpo-functions-spike/grpo/rollouts/`.
