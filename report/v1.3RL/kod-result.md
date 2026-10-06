# KodCode → Jac RL: Pre-screen Results

October 5, 2026

**Goal:** turn KodCode's Python tasks into Jac RL tasks without an LLM, then measure how hard they are for the v1.3-A SFT model and which subsets give GRPO a learning signal.

---

## 1. What KodCode is

[KodCode-V1](https://huggingface.co/datasets/KodCode/KodCode-V1) ([paper](https://arxiv.org/abs/2503.02951)) is a fully synthetic Python coding dataset built for SFT and RL. It has 484,097 train rows and is licensed CC BY-NC 4.0. Each row has:

- `question`: the task. It comes in two styles. `instruct` is a natural-language problem. `complete` is a Python function stub with a docstring and `>>>` examples.
- `solution`: a Python solution written by GPT-4o.
- `test`: pytest unit tests written by GPT-4o. The solution passed them during self-verification.
- `test_info`: function name and declaration.
- `gpt_difficulty`: easy / medium / hard, based on how often GPT-4o's solution passed its own tests over up to 10 attempts. It measures how reliably GPT-4o self-verified, not how hard the algorithm is.
- `benchmark_similarity`: maximum cosine similarity to HumanEval, MBPP, BigCodeBench and LiveCodeBench questions.

### Conversion to Jac (no LLM)

Producer: `script/dataset/rl/kodcode.py` → `dataset/rl/functions/kodcode-1k/`. Survey details are in `dataset/raw/hf/KodCode-V1/CONVERSION.md`.

| Step | Filter | Rows left |
|---|---|---:|
| 0 | All train rows | 484,097 |
| 1 | One function to write | 338,970 |
| 2 | No class in the solution; every test is `assert fn(<literals>) == <literal>` | 147,076 |
| 3 | Solution imports stdlib only | 145,460 |
| 4 | No code fence in the question | 120,101 |
| 5 | `benchmark_similarity` ≤ 0.8 (no benchmark look-alikes), ≥ 3 tests | 106,546 |

About 116K of the 120K can get a typed signature mechanically. This is checked per task when the task is built.

For each task:
- **Request.** The `instruct` question plus one example taken from the first test, or the `complete` docstring with its first 2 `>>>` examples. "Python" is replaced with "Jac".
- **Starter.** A typed Jac signature built from the AST. Missing types are inferred from the test literals, e.g. `[1, 2]` → `list[int]`.
- **Hidden tests.** Each pytest `assert` becomes a Jac `test` block.
- **Reference solution.** `jac tool py2jac` on the Python solution, used only to validate the tests. The model never sees it.
- **Validation.** The reference solution must score 1.0 and the starter must score below 1.0. The starter must also pass `jac check` with no warnings other than W2003.

Classes, trees, linked lists and non-literal tests are dropped at step 2, so no task asks the model to define a node type.

## 2. Subsets

KodCode has 12 subsets. The sizes below are upstream counts from the dataset card.

| Subset | Kind | Upstream size | What it looks like |
|---|---|---:|---|
| Prefill | Simple coding questions | 43K | Short "write a function that …" tasks |
| Leetcode | Coding assessment | 27K | LeetCode-style interview problems |
| Codeforces | Coding assessment | 33K | Competitive-programming problems recast as functions |
| Apps | Coding assessment | 21K | APPS-style problems |
| Taco | Coding assessment | 81K | TACO competitive problems |
| Code_Contests | Coding assessment | 36K | DeepMind CodeContests problems |
| Algorithm | DSA knowledge | 31K | Sorting, search, DP, graph algorithms on plain data |
| Data_Structure | DSA knowledge | 34K | Stack / queue / heap / hash-map exercises |
| Docs | Technical documentation | 43K | Tasks built around Python library docs |
| Filter | Others | 77K | Filtered general coding questions (instruct only) |
| Package | Others | 7K | Tasks around specific packages (instruct only) |
| Evol | Others | 13K | Evol-Instruct-style rewritten questions |

`kodcode-1k` samples 100 tasks per subset that pass validation. Docs (55) and Package (39) have fewer because most of their tasks need non-stdlib packages or non-literal tests.

- Total: 1,094 tasks, split 875 train / 109 dev / 110 test, with 9,065 hidden tests.
- Style: 668 complete / 426 instruct.
- Difficulty: 627 easy / 268 medium / 199 hard.

## 3. Spike

### Setup

- Model: v1.3-A SFT adapter (`output/adapter/0926-v13-A/sft/adapter`)
- 8 samples per task, temperature 0.8, max 768 new tokens
- Grading is the same as in GRPO (`script/eval/rl/run_eval.py`): `jac check`, then the hidden tests; reward = 0 on check failure, else passed / total tests
- Runs: `output/eval/rl/functions/kodcode-1k/v13A-prescreen_{train,dev,test}_*`
- Cost: generation took 75 min for train (7,000 samples), 10 min each for dev and test, plus about 5 s of grading per task

### Overall

| split | tasks | pass@1 | pass@8 | mean reward | compile rate | 1–7 of 8 pass | reward varies |
|---|---:|---:|---:|---:|---:|---:|---:|
| train | 875 | 38.9% | 70.4% | 0.61 | 90.5% | 59.8% | 87.5% |
| dev | 109 | 37.4% | 67.0% | 0.59 | 90.6% | 57.8% | 89.9% |
| test | 110 | 34.8% | 68.2% | 0.57 | 88.6% | 61.8% | 90.9% |

Sample outcomes on train: 2,724 pass, 3,487 test_fail, 576 check_fail, 113 timeout, 92 format_fail, 8 memory_cap.

### By subset (all 1,094 tasks)

| subset | tasks | mean full passes /8 | 0/8 | 8/8 | 1–7/8 | reward varies | mean test pass % | mean reward std | format_fail | check_fail | test_fail |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Codeforces | 100 | 2.1 | 40% | 3% | 57% | 95% | 49% | 0.27 | 3% | 9% | 60% |
| Leetcode | 100 | 2.3 | 35% | 4% | 61% | 96% | 55% | 0.26 | 2% | 9% | 59% |
| Code_Contests | 100 | 2.4 | 38% | 5% | 57% | 95% | 52% | 0.26 | 2% | 11% | 56% |
| Taco | 100 | 2.5 | 38% | 6% | 56% | 93% | 54% | 0.25 | 2% | 10% | 56% |
| Data_Structure | 100 | 2.5 | 32% | 4% | 64% | 94% | 53% | 0.24 | 1% | 8% | 52% |
| Docs | 55 | 2.6 | 44% | 11% | 45% | 75% | 48% | 0.21 | 1% | 15% | 51% |
| Algorithm | 100 | 2.8 | 33% | 8% | 59% | 90% | 61% | 0.24 | 1% | 7% | 54% |
| Apps | 100 | 3.4 | 24% | 10% | 66% | 89% | 65% | 0.24 | 1% | 7% | 48% |
| Evol | 100 | 3.7 | 24% | 13% | 63% | 86% | 67% | 0.23 | 1% | 8% | 45% |
| Package | 39 | 4.1 | 13% | 13% | 74% | 87% | 69% | 0.27 | 0% | 8% | 40% |
| Prefill | 100 | 4.2 | 23% | 24% | 53% | 73% | 74% | 0.20 | 0% | 7% | 40% |
| Filter | 100 | 4.6 | 14% | 22% | 64% | 78% | 76% | 0.20 | 1% | 6% | 36% |

### By style

| style | tasks | mean full passes /8 | 0/8 | 8/8 | 1–7/8 | reward varies | mean test pass % | mean reward std | format_fail | check_fail | test_fail |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| complete | 668 | 2.8 | 34% | 8% | 58% | 89% | 57% | 0.24 | 1% | 9% | 53% |
| instruct | 426 | 3.5 | 24% | 13% | 63% | 86% | 65% | 0.24 | 1% | 7% | 46% |

### By KodCode difficulty

| difficulty | tasks | mean full passes /8 | 0/8 | 8/8 | 1–7/8 | reward varies | mean test pass % | mean reward std | format_fail | check_fail | test_fail |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| easy | 627 | 3.7 | 22% | 14% | 64% | 84% | 66% | 0.23 | 1% | 8% | 43% |
| medium | 268 | 2.3 | 38% | 4% | 57% | 93% | 54% | 0.25 | 1% | 10% | 59% |
| hard | 199 | 2.1 | 46% | 5% | 49% | 94% | 50% | 0.24 | 3% | 9% | 60% |

Column definitions:
- **full pass** = the sample passes every hidden test (reward 1.0)
- **0/8, 8/8, 1–7/8** = share of tasks with that many full passes out of 8 samples. With full-pass counting, 1–7/8 is "active".
- **reward varies** = the 8 rewards are not all equal. GRPO's advantage is reward minus group mean, so these tasks give a gradient under partial-credit reward.
- **mean test pass %** = mean reward = average fraction of hidden tests passed (0 on check failure)
- **mean reward std** = average within-task standard deviation of the 8 rewards
- **format_fail / check_fail / test_fail** = share of all samples ending in that status

### What it shows

- **The conversion keeps the tasks hard enough for RL.** pass@1 is about 37% and pass@8 about 70%, and the three splits agree. KodCode is easy in Python, but writing it in Jac is not easy for v1.3-A.
- **Failures are mostly wrong logic, not Jac syntax.** test_fail accounts for about 50% of samples, while check_fail is about 9% and format_fail about 1%.
- **Most tasks give a signal.** 60% are active (1–7 full passes). With partial-credit reward, 88% have rewards that vary. `splits/train_active.txt` holds the 523 active train tasks.
- **Competition-style subsets give the best signal.** In Codeforces, Leetcode, Code_Contests, Taco and Data_Structure, about 95% of tasks have rewards that vary, with the highest reward std.
- **Filter and Prefill are the easiest.** About a quarter of their tasks are 8/8, which gives no gradient. Downweight them, or keep only their active tasks.
- **Docs is the weakest fit.** It has the most 0/8 tasks (44%) and the highest check_fail (15%), because its tasks lean on Python-library APIs that don't map cleanly to Jac.
- **`complete` (stub) tasks are harder than `instruct`.** They average 2.8 vs 3.5 full passes out of 8.
- **KodCode's difficulty label tracks Jac difficulty.** Mean full passes go from 3.7 (easy) to 2.3 (medium) to 2.1 (hard).

## 4. Next steps

1. Run GRPO on `train_active.txt` (523 tasks), weighted toward the competition and DSA subsets plus Apps and Evol.
2. Tasks that never fully pass but have rewards that vary (0/8 with partial credit) add signal, but they carry a reward-hacking risk, such as special-casing the visible example. Add them only after checking rollouts.
3. To scale up, draw more tasks from the 106,546-task eligible pool using the same subset weights, and pre-screen them the same way.
4. Tree and linked-list families, which need a provided `node`/`edge` adapter, are still deferred.
