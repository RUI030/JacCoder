# SPIKE scripts

Investigation scripts for `SPIKE.md`. Each numbered script writes artifacts to
`script/spike/out/<script>/`; `review.ipynb` loads those artifacts and renders.

Compute lives in scripts. Notebook is display-only.

## Layout

```
script/spike/
├── spike_utils.py        # adapter iteration, module walker, io helpers
├── 01_loss_matrix.py     # per-checkpoint × per-dataset eval loss
├── 02_gradnorm_matrix.py # per-checkpoint × per-dataset grad norms (fwd+bwd, no step)
├── 03_adapter_svd.py     # ΔW = B·A → SVD, norms, drift, alignment
├── out/                  # artifacts (parquet, npz, png). gitignored.
└── review.ipynb          # heatmaps, spectra, drift plots
```

## Stages under study

Adapters at `output/adapter/`, trained **sequentially without merging CPT**.
Ayush CPT stages (1-2) are dropped as noise; evaluate last CPT + all SFT:

3. `08-24_16-57-Nitin-10k-jac-functions`   (CPT)
4. `08-24_18-37-sft-code_completion-Nitin-10k-jac-functions` (SFT)
5. `08-24_19-41-sft-js2jac-Nitin-js2jac`   (SFT)
6. `08-24_20-54-sft-py2jac-opus-synth-v2`  (SFT)
7. `08-24_21-17-sft-code_gen-opus-synth-v2` (SFT)
8. `08-24_21-30-sft-qa-opus-synth-v2`      (SFT)

Slices: `dataset/sft/{code_completion,code_gen,js2jac,py2jac,qa}/*/valid.jsonl` — rows are `{"messages": [...]}`.

Base: `ornith-ai/Ornith-1.5-9B` (Qwen 3.5 9B), r=128, α=32,
targets: q/k/v/o + gate/up/down + embed/lm_head.

## Run order

```bash
python script/spike/03_adapter_svd.py         # cheapest, no forward pass
python script/spike/01_loss_matrix.py
python script/spike/02_gradnorm_matrix.py
jupyter lab script/spike/review.ipynb
```
