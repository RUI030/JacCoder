# Nitin function-eval-v1 (vendored)

Self-contained plug-in copy of `jac-data-gen/evals/function/v1` and its
grader, wired to run against local adapters in this repo.

## Layout

```
script/eval/Nitin-test/
├── README.md
├── PROVENANCE.md              upstream commit, refresh procedure
├── data/function/v1/
│   ├── public/{dev,test}.jsonl    prompts + visible prefix (400 / 1000 rows)
│   ├── private/{dev,test}.jsonl   hidden refs + test blocks — never train on
│   ├── manifest.json, clusters.jsonl, denylist_*
│   └── README.md
├── graders/
│   └── eval_jac.py            standalone grader (stdlib only)
└── run_eval.py                inference + grade wrapper
```

## Run

```bash
# quick dev pass
python script/eval/Nitin-test/run_eval.py \
  --adapter output/adapter/0910-trueseq-r64/sft/adapter \
  --split dev --limit 20

# full test suite
python script/eval/Nitin-test/run_eval.py \
  --adapter output/adapter/0910-trueseq-r64/sft/adapter \
  --split test --k 1 --workers 4
```

Outputs land in `out/<tag>_<split>_<stamp>/`:
- `samples.jsonl` — model completions
- `results.jsonl` — per-sample verdicts from the grader
- `summary.json` — pass@k, status counts, metadata

## Notes

- Prompts are continuation-style; the runner strips a leading ```jac fence
  if the model emits one (dataset prompts explicitly say "no Markdown fences").
- Adapter is auto-merged in RAM by `utils.model.load_model()`; no disk merge
  needed.
- To refresh from upstream, see `PROVENANCE.md`.
