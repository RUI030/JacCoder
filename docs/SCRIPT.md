## notebook

## dataset
processing raw data, make it correct format for training, provide tools to see the distribution of data.

Layout:
```
script/dataset/
├── cpt/              # raw → CPT split builders
│   └── singlefile.py
├── sft/              # raw → SFT split builders
│   ├── js2jac.py
│   ├── qa.py
│   └── code_complete.py
├── parser/           # chunking / AST helpers
│   ├── chunk.py
│   └── md2ast.py
├── template/         # prompt_template.json, ds_report.json
└── statistics.py     # dataset stats
```

Each builder in `cpt/` / `sft/` runs as `python script/dataset/<cpt|sft>/<name>.py`; edit the config block at the top to point at a raw dataset under `dataset/raw/<format>/<name>/`.

## utils
### io
### classifier

## train

## eval