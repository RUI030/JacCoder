# Eval scripts — decision tree

Full manual: `docs/EVAL.md`. This file is the "what do I run when" cheat sheet.

## Layout

```
script/eval/
  gate.py                    # scorer: predictions.jsonl → report.json (pass-rate)
  batch.py                   # loads model once, runs infer+gate over EVAL_SET
  infer/                     # producers of predictions.jsonl
    adapter.py               # local HF adapter (Unsloth-loaded)
    openrouter.py            # any OpenRouter-hosted model (Claude, GPT, …)
  compare/                   # post-hoc analysis over report.json / predictions.jsonl
    confmat.py               # per-sample pass/fail confusion matrix
    taxonomy.py              # cluster failures by check_err first-line
  probe/                     # intrinsic model analysis (no dataset scoring)
    svd_energy.py            # LoRA rank sizing via SVD of ΔW = B@A
    cpt_loss.py              # forward NLL per CPT checkpoint
    adapter_viewer.ipynb     # interactive companion to svd_energy
```

## I want to…

| Task | Command |
|---|---|
| Eval one adapter across all SFT tasks | `python script/eval/batch.py --adapter <path> --limit 0` |
| Eval one (task, ds) only | `python script/eval/batch.py --adapter <path> --tasks osp --limit 0` |
| Eval a hosted model (OpenRouter) | `python script/eval/infer/openrouter.py --model <slug> --task <t> --ds <ds>` then `gate.py --pred <path>` |
| Score existing predictions.jsonl | `python script/eval/gate.py --pred <path/to/predictions.jsonl>` |
| See which samples flipped between two runs | `python script/eval/compare/confmat.py --a A/report.json --b B/report.json` |
| Cluster failures by error type | `python script/eval/compare/taxonomy.py --a A/report.json --b B/report.json` |
| Check LoRA rank utilization | `python script/eval/probe/svd_energy.py --adapter <adapter_dir>` |
| CPT loss per checkpoint | `python script/eval/probe/cpt_loss.py --run <cpt-run> --ds <ds>` |

## Adding a new eval

**New task or dataset** → edit `EVAL_SET` in `batch.py`. Dataset lives at `dataset/sft/<task>/<ds>/valid.jsonl`.

**New inference backend** (vLLM, GGUF, another API) → add `infer/<backend>.py` producing predictions.jsonl in the same schema as `infer/adapter.py`. Nothing else changes — `gate.py`, `compare/*`, `probe/*` all work.

**New analysis on predictions** → add to `compare/`.

**New analysis on weights** → add to `probe/`.

## Output convention

All eval output lands under `output/eval/<task>/<ds>/<tag>_<stamp>/` where `<tag>` is the adapter parent dir name (or model slug for OpenRouter). Same shape regardless of backend → any `compare/*` script works cross-backend.
