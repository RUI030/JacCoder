# JacLLM Progress Report

September 16, 2026

<!-- Slide draft. Keep research details and unresolved questions in comments. -->

---

## Outline

### 0. What’s New

- OSP training data
- Behavioral evaluation with `jac test`

### 1. Qwen3-Coder 30B-A3B

- Training setup → dataset → model output → statistics

### 2. Ornith 1.5 9B Pilot

- Training setup → dataset → model output → statistics

### 3. Conclusion and Next-Step Alignment

---

# 0. What’s New

---

## New: OSP Training Data

- Added examples for nodes, edges, walkers, and traversal
- Expanded training beyond basic functions and translation
- Evaluated whether the model can produce valid OSP code

**Goal:** teach both Jac syntax and Jac-native programming patterns.

<!--
TODO: add OSP train/validation counts and one representative training example.
Clarify whether OSP data was added to both model runs or only the relevant
lineage. Do not imply identical datasets for 30B and 9B.
-->

---

## New: Evaluation with `jac test`

- `jac check`: Does the output compile?
- `jac test`: Does the output behave correctly?

### Hidden tests now detect

- Wrong algorithms
- Missing edge cases
- Incorrect output formats
- Incorrect graph and walker behavior

**Why it matters:** valid Jac is not always correct Jac.

<!--
This is the main evaluation contribution of the reporting period.
Use one small compile-pass/test-fail example if space allows.
-->

---

# 1. Qwen3-Coder 30B-A3B

---

## 30B — Training Setup

- Base model: Qwen3-Coder 30B-A3B-Instruct
- Mixture-of-Experts model: approximately 3B active parameters
- LoRA fine-tuning on selected transformer blocks
- SFT only for this training run
- 8,200 training steps

<!--
Verified in Ayush's report:
- 48 blocks, 128 experts, top-8 routing
- 16 selected blocks
- LoRA rank 16, scale 2.0, dropout 0.05
- 281.8M trainable parameters (0.92%)
- max sequence length 3,072
- approximately 0.65 epoch
- approximately 2.49M trained tokens
- Apple Silicon / MLX

Keep implementation details off the main slide unless the audience asks.
-->

---

## 30B — Training Dataset

- Function completion
- Python-to-Jac translation
- JavaScript-to-Jac translation
- Graph and OSP code generation
- Full-stack code generation

### Current concern

- Some training targets do not pass `jac check`
- Full-stack examples contain the most visible data-quality issues

<!--
Ayush's corpus audit sampled 302 training rows and estimated a
population-weighted jac check pass rate of approximately 73.6%.

Reported sample pass rates:
- code_gen / Graph: 98.3%
- code_gen / OSP: 98.3%
- js2jac / Function: 86.7%
- py2jac / Function: 73.3%
- js2jac / Fullstack: 53.3%

Working hypothesis: the lower 30B compile rate may be related to training on
data that was not washed with the same jac check gate as the 9B v1.2 data.
Verify the actual 30B preprocessing pipeline before stating this as causation.
-->

---

## 30B — Example Output and Observation

### OSP example

- Generates valid nodes, edges, walkers, `visit`, and `spawn`
- Passes `jac check`
- Passes `jac run`

### But the behavior is wrong

- Builds a chain instead of the requested tree
- Performs breadth-first traversal instead of depth-first traversal
- The two errors hide each other in the printed output

**Observation:** compilation and execution cannot replace behavioral tests.

<!--
Use the DFS example from the 30B report.
Show the requested tree, generated chain, and traversal order visually rather
than placing the full code on the slide.

Optional second example: the full-stack component learned missing-return and
JavaScript-style dict access from faulty training examples.
-->

---

## 30B — Evaluation Results

### 1,000 hidden-test problems

| Metric | Result |
|---|---:|
| Emits a Jac block | 99.8% |
| Passes `jac check` | 71.5% |
| Passes all hidden tests | **54.9%** |
| Correct among compiling outputs | 76.8% |

### Observation

- Strong semantic performance after the output compiles
- Compilation remains a major source of lost tasks
- Data quality may be limiting Jac syntax reliability

<!--
Counts:
- Jac block: 998/1,000
- jac check: 715/1,000
- all tests pass: 549/1,000
- base model pass@1: 2.9%
- reference ceiling: 84.6% AC

Do not include the reported jaclang 0.16.1 metadata until it is confirmed; it
may be a typo.
-->

---

# 2. Ornith 1.5 9B Pilot

---

## 9B — Training Setup

- Base model: Ornith 1.5 9B
- Continued pre-training followed by SFT
- Multi-task training across Jac generation tasks
- Target language version fixed to Jac 0.36.x
- Pilot focused on data quality and Jac specialization

<!--
TODO: verify the exact v1.2 recipe, ordering, token count, LoRA configuration,
epochs, and hardware from the training config/logs.

Do not copy the old v1 SFT stack description into v1.2 without checking the
actual 09-10 adapter lineage.
-->

---

## 9B — Training Dataset

### Main change from v1

- Remove examples that fail `jac check`
- Normalize the corpus to Jac 0.36.x
- Add dedicated OSP examples
- Reduce stale and inconsistent syntax in the training signal

**Hypothesis:** cleaner data can offset part of the model-size gap.

<!--
TODO: add before/after dataset row counts and rejection rates.

Known evaluation dataset drift:
- code completion was rebuilt from Nitin-10k to washed Nitin-9k data
- JS-to-Jac changed from the original 923-row split to a new 600-row split
- Python-to-Jac validation changed from 388 to 93 rows

Because evaluation splits changed, not every v1-to-v1.2 delta is a controlled
comparison.
-->

---

## 9B — Example Output and Observation

### Full-stack application attempt

- Generates the basic full-stack structure
- Recognizes walkers and API-like behavior
- Misses implicit rules for exposing a walker as an API

### Observation

- Surface syntax is improving
- Framework conventions remain underrepresented
- Full-stack tasks require cross-component reasoning

<!--
TODO: insert the actual prompt and generated output.
The final slide should show only:
1. relevant generated code,
2. error or incorrect behavior,
3. implicit rule that was missed,
4. minimal correction.

Verify the walker-as-API rule against the current Jac endpoint behavior before
finalizing the explanation.

Optional additional example: one successful OSP output to balance the failure
case and show progress.
-->

---

## 9B — `jac check` Results

| Task | v1 | v1.2 |
|---|---:|---:|
| Overall | 71.0% | **87.0%** |
| Code completion | 88.5% | **92.6%** |
| Code generation | 54.6% | **61.7%** |
| JS-to-Jac | 48.2% | **85.3%** |
| OSP | 68.0% | **98.1%** |
| Python-to-Jac | 76.3% | **92.5%** |

**Main result:** OSP and overall Jac syntax reliability improved substantially.

<!--
Counts:
- v1 overall: 2,340/3,294
- v1.2 overall: 2,679/3,081
- OSP: 140/206 -> 202/206
- code generation: 251/460 -> 284/460

OSP and code generation use the same named eval sets and sample counts.
Other task splits changed; present those improvements as directional.

TODO: determine whether the comparison model should be labeled v1 or v1.1.
-->

---

## 9B — `jac test` Results

### 1,000 hidden-test problems

| Metric | Result |
|---|---:|
| Passes `jac check` | **81.1%** |
| Passes all hidden tests | 49.8% |
| Correct among compiling outputs | 61.4% |

### Main failure modes

- Misread specification
- Wrong algorithm
- Wrong output format
- Missed edge case

<!--
Run: sft_test_09-13_17-28

Counts:
- 498 pass
- 188 model check failures
- 208 model semantic failures
- 49 native limitations
- 49 bytecode issues
- 7 infrastructure failures
- 1 extraction failure

Fair pass@1 excluding the 105 Jac/infrastructure failures:
498/895 = 55.6%.

Manual analysis of 105 semantic failures:
- misread specification: 22.9%
- wrong algorithm: 21.0%
- wrong output format: 17.1%

Keep raw 49.8% as the headline number for comparison.
-->

---

# 3. Conclusion and Next-Step Alignment

---

## 30B and 9B: What Did We Learn?

| | 30B | 9B v1.2 |
|---|---:|---:|
| Passes `jac check` | 71.5% | **81.1%** |
| Passes all tests | **54.9%** | 49.8% |
| Correct after compiling | **76.8%** | 61.4% |

- The 9B model produces valid Jac more consistently
- The 30B model reasons better once its output compiles
- Model capacity and data quality solve different parts of the problem

<!--
This is a comparison of the two trained systems, not a controlled model-size
ablation. Base models, training recipes, and likely data quality differ.

Working interpretation:
- Clean data helps the smaller model learn reliable Jac syntax.
- More model capacity helps with semantic correctness.
-->

---

## Conclusion

- OSP generation improved substantially
- Dataset washing improved Jac syntax reliability
- `jac test` exposed the gap between syntax and behavior
- Full-stack conventions remain a major weakness
- The next opportunity is feedback-driven self-repair

<!--
Avoid claiming OSP is solved. The 98.1% result is jac check, not a behavioral
OSP success rate.
-->

---

## Next Step: Self-Debugging

1. Give the model compiler and test feedback
2. Ask it to diagnose and repair its output
3. Measure repair success by failure type

### If the model can repair itself

- Generate more examples from real repositories
- Validate them with `jac check` and `jac test`
- Build a failure → diagnosis → fix dataset
- Move toward GRPO with a verified reward signal

<!--
Suggested pilot:
- syntax failures
- small semantic errors
- wrong algorithms
- OSP behavior
- full-stack integration

Measure first-attempt repair, multi-attempt repair, and regressions.
Keep model failures separate from Jac and evaluation infrastructure failures.
-->

---

## Alignment Needed

- Is self-debugging the next priority?
- Should new data focus on full-stack apps or function correctness?
- How much repair success is enough to start self-generated data?
- What must be validated before starting GRPO?

<!--
Evidence:
- report/v1.2/check_report.md
- HDD output/eval/eval/report-v1-baseline.md
- script/eval/Nitin-test/out/sft_test_09-13_17-28/
- report/Qwen30BA3B/08/0916 JacLLM Weekly - Ayush sections.pdf
-->
