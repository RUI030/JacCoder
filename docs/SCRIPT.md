## notebook

## dataset
processing raw data, make it correct format for training, provide tools to see the distribution of data.

Layout:
```
script/dataset/
├── cpt/              # raw → CPT split builders
│   ├── file.py
│   └── repo.py
├── sft/              # raw → SFT split builders
│   ├── code_complete.py
│   ├── farm.py
│   ├── js2jac.py
│   ├── osp.py
│   ├── qa.py
│   └── scaffold2impl.py
├── parser/           # chunking / AST / repo helpers
│   ├── chunk.py
│   ├── md2ast.py
│   └── repo.py
├── template/         # prompt_template.json, ds_report.json
├── pipeline.py       # shared split + write used by every builder
├── inspect.py        # JSONL schema inspector
└── statistics.py     # dataset stats
```

Full layout and style rules: [CONVENTION.md](CONVENTION.md).

Each builder in `cpt/` / `sft/` runs as `python script/dataset/<cpt|sft>/<name>.py`; edit the config block at the top to point at a raw dataset under `dataset/raw/<format>/<name>/`.

## utils
### io
### classifier

## train

## eval