# Dataset — TODO

Tracks open work against `PROPOSAL.md`. Check items off as they land.

## Builders
- [x] `code2cpt` — file-per-row CPT builder
- [x] `md2cpt` — markdown chunked CPT builder
- [x] `html2cpt` — tag-cleaning + markdown chunker (uses `html.parser`)
- [x] `repo2cpt` — repo-level packing, split-at-repo
- [ ] `build_sft_dataset.py` — SFT builder(s); PROPOSAL lists the file in the layout but does not yet spec builders. Decide input formats (JSONL of `{prompt, response}`? `.md` Q&A? existing HF datasets?) then add per-input builders and a shared `messages`-emitting helper.

## Shared helpers
- [x] `io.walk_files` / `io.write_shards`
- [x] `chunking.chunk` (markdown / code / line boundaries, breadcrumb, overlap)
- [x] `classifier.classify` (single-label, complexity order)
- [ ] `classifier.compiler` — use `jac check --json` or the AST for parse-status and archetype histogram. Wire once we have a stable `jac check` JSON schema.

## Format / tooling
- [x] `jsonl2parquet` — Parquet + `dataset_info.json`
- [x] `statistic` — Markdown + JSON per-shard report
- [ ] Add a `stats/` output convention (report currently lands as `<shard>.md`/`.json` next to the shard dir — decide whether to keep beside or move under a top-level `stats/` folder).

## Known gaps / follow-ups
- [ ] `html2cpt.strip_selectors` currently raises `NotImplementedError`. Wire BeautifulSoup (or `selectolax`) when a real HTML corpus arrives.
- [ ] Chunker `boundary="code"` uses a coarse top-level-def regex. When we ingest larger Jac repos, swap to the Jac AST via `jaclang` for accurate boundaries.
- [ ] `count_tokens` currently hard-fails without `tiktoken`. Consider a `whitespace` fallback for stat runs on machines without it.
- [ ] Reproducibility: document the exact `tokenizer` used per shard in the shard's `dataset_info.json` so a stats rerun is deterministic.
- [ ] CLI entry points for `code2cpt`/`md2cpt`/`html2cpt`/`repo2cpt` (currently importable only). A small `python -m script.build_cpt_dataset code <path>` dispatcher would help.
- [ ] Unit tests: at minimum `io._resolve_splits` (sum>1 raises, sum<1 auto-fills, name auto-fill), `classifier.classify` (each class's signals fire), and `chunking.chunk` (breadcrumb + max_tokens respected).

## Ideas / stretch
- [ ] Add a `raw/manifest.yaml` per raw source describing license, provenance, and preferred source-tag override.
- [ ] Cross-shard mix config (a top-level YAML that maps shard directories to sampling weights, consumed by the trainer).
- [ ] `jac check`-based hard filter to drop syntactically invalid rows before training.
