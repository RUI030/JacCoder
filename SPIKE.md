# SPIKE: Diagnosing "Looks-Jac / Doesn't-Work" Fine-Tuned Model

Symptom: model emits syntactically Jac-shaped code that fails `jac check` (~88% pass) and often ignores the instruction. Goal: figure out whether the failure lives in **data**, **adapter**, or **objective** before another full run.

## Setup

Adapters at `output/adapter/`, trained **sequentially** (each starts from the previous, not merged). Stages 1-2 (Ayush CPT) are dropped from eval as noise; we evaluate on the last CPT + all SFT stages:

| # | Stage | Adapter |
|---|-------|---------|
| 3 | CPT | `08-24_16-57-Nitin-10k-jac-functions` |
| 4 | SFT | `08-24_18-37-sft-code_completion-Nitin-10k-jac-functions` |
| 5 | SFT | `08-24_19-41-sft-js2jac-Nitin-js2jac` |
| 6 | SFT | `08-24_20-54-sft-py2jac-opus-synth-v2` |
| 7 | SFT | `08-24_21-17-sft-code_gen-opus-synth-v2` |
| 8 | SFT | `08-24_21-30-sft-qa-opus-synth-v2` |

Eval slices: `dataset/sft/{code_completion,code_gen,js2jac,py2jac,qa}/*/valid.jsonl`.

**Known issue:** CPT adapters were never merged into base before SFT — all 8 stages share the same LoRA rank slots and keep stacking into the same low-rank subspace. Expect: later stages fight earlier ones inside the same A/B matrices; adapter direction may drift, magnitude may saturate, and gradient signal on already-used directions collapses. This alone can explain surface-mimicry / instruction drift.

---

## 1. Loss across stages × datasets

Compute eval loss for **each of the 8 checkpoints** on **each dataset slice** (Ayush, Nitin-10k, js2jac, py2jac, code_gen, qa) — one heatmap.

Metrics to observe:
- Per-slice eval loss at each checkpoint (does adding SFT-qa raise loss on Nitin-10k? = forgetting).
- Train vs. eval loss gap per stage (overfitting per dataset).
- Token-position loss curve per slice (spike at opening tokens → surface mimicry).
- Loss vs. `jac check` pass-rate correlation per stage (loss ↓ but pass-rate flat → wrong proxy).

Decision rules:
- Loss on stage N's own data goes down, loss on stage N-1's data goes up → **catastrophic interference** from shared rank; merge CPT before SFT, or split adapters.
- All slices plateau at similar loss → **under-capacity** in the current rank.
- Position curve spikes early then flattens → model memorized openings.

---

## 2. Grad-norm across stages × datasets

For each checkpoint, run forward+backward only (no optimizer step) on each slice.

Metrics to observe:
- Global ‖∇‖₂ per slice per checkpoint.
- Per-module ‖∇‖: attn `W_q/W_k/W_v/W_o` vs. MLP `up/gate/down_proj`, split by A vs. B.
- Layer-wise ‖∇‖ (early/mid/late).
- Cross-slice grad cosine similarity per checkpoint (do slices reinforce or fight?).

Decision rules:
- Grads collapse to ~0 on stage-1 data by stage-8 → rank exhausted, directions locked.
- Grads concentrate in different modules per slice → different failure modes; consider slice-specific adapters.
- Negative cosine between slices → data mix conflicts (e.g. js2jac vs. qa pulling opposite).
- Attn ≫ MLP grads → token co-occurrence learning; instruction-following (MLP) starved.

---

## 3. Adapter SVD + layer analysis

For each of the 8 adapters, per module: compute ΔW = B·A (scaled by α/r), then SVD → U Σ Vᵀ.

### 3.1 Singular value spectrum
- Plot log(σ_i) vs. i for each module (attn q/k/v/o, MLP up/gate/down), overlaid across stages.
- Elbow location vs. configured rank r.
- Effective rank via participation ratio: exp(H(σ²/Σσ²)) — entropy of normalized spectrum.
- Stable rank: ‖ΔW‖_F² / ‖ΔW‖₂² = Σσ_i² / σ_1².
- σ_1 / σ_r ratio (condition number of the update).

Decide: elbow ≪ r → drop rank; spectrum flat to the tail → under-provisioned; σ_1 dominates → update is essentially rank-1.

### 3.2 Norms and magnitude
- ‖ΔW‖_F per module, per layer, per stage.
- ‖ΔW‖_F / ‖W₀‖_F (relative update size — the "how much am I moving base").
- ‖ΔW‖_2 (spectral / operator norm) per module.
- ‖A‖_F and ‖B‖_F separately (which side is doing the work; imbalance signals init/LR issue).
- Per-layer stacked bar: contribution to total ‖ΔW‖ by layer index.
- Per-module-type totals: attn vs. MLP budget split.

Decide: ‖ΔW‖_F/‖W₀‖_F > ~0.1 → large-magnitude, forgetting risk; attn ≫ MLP → shift budget to MLP; late layers dominate → freeze early; ‖A‖ ≫ ‖B‖ (or reverse) → init or LR asymmetry.

### 3.3 Direction and drift across stages
- Top-k left singular vectors U_k of ΔW at stage N vs. stage N-1: principal angles → subspace overlap `cos θ_i`.
- Same for right vectors V_k.
- Grassmann distance between consecutive stages per module.
- Direction of ΔW itself: cosine(vec(ΔW_N), vec(ΔW_{N-1})).
- Cumulative drift: overlap of stage-8 subspace vs. stage-1.
- Novel-direction fraction per stage: 1 − mean top-k overlap.

Decide: overlap < 0.5 between consecutive stages → each stage overwrites the last (un-merged-CPT confirmed); cumulative overlap ≈ 0 → CPT gains erased by SFT — must merge CPT before SFT next time.

### 3.4 Rank utilization inside the adapter
- Column norms of B and row norms of A per module — are all r ranks used, or is it effectively rank-k with k < r?
- σ-tail energy: fraction of ‖ΔW‖_F² in the smallest (r − k) singular values.
- Dead-rank count per module (σ_i / σ_1 < 1e-3).

Decide: many dead ranks → over-provisioned; tail energy high → all ranks contributing, keep or raise.

### 3.5 Alignment with base weights
- For top singular directions of ΔW: cosine with top singular directions of W₀.
- Projection of ΔW onto W₀'s top-k subspace (‖P·ΔW‖_F / ‖ΔW‖_F).

Decide: high alignment → adapter is amplifying existing base features (safer, less forgetting); low → carving new directions (more capacity, more risk).

### 3.6 Cross-module and cross-layer patterns
- Heatmap: layer × module → ‖ΔW‖_F / ‖W₀‖_F.
- Same heatmap for stable rank.
- Same heatmap for stage-to-stage subspace overlap.

Decide: heatmap tells you *where* to reallocate rank budget and *which* layers to freeze for the next run.

---

## Metrics dashboard (every eval)

- CE loss (train + per-slice eval)
- `jac check` pass rate on generated code
- Instruction-adherence score (rubric or LLM-judge)
- Per-module stable rank + ‖ΔW‖_F/‖W₀‖_F
- Cross-stage subspace overlap
