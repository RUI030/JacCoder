# Dataset (Proposal)

Revised proposal for the training-data prep pipeline. See end of file for the
diff-list against `README.md`.

Design rule: **simple, elegant, minimal — only process necessary info, but
general and easy to extend.** Never implement the same function twice; shared
logic lives in one place.

Pipeline:

```
raw/  ──►  script/  ──►  CPT/  or  SFT/
```

| Folder   | Purpose |
| -------- | ------- |
| `raw/`    | Unprocessed source material. Never edited in place. |
| `script/` | Processing code: build CPT/SFT shards, chunking, classification, stats, format conversion. |
| `CPT/`    | Continual-pretraining shards. |
| `SFT/`    | Instruction/response pairs. |

Shard files are named after the raw source they came from (e.g.
`CPT/Nitin-10k-jac-functions/train.jsonl`) so provenance lives in the path,
not in every row.

# Format

JSONL during development, Parquet once a dataset is frozen (see `jsonl2parquet`).

## CPT — Continual Pre-training

Unsupervised next-token objective. One document per row.

**Required**
```json
{"text": "YOUR_TRAINING_DATA"}
```

**Optional metadata**
```json
{
  "text": "...",
  "meta": {
    "source": "code",          // one of: code | blog | book | repo | html | md | other
    "class":  "osp"            // single label, see classifier.py
  }
}
```

Notes:
- `source` is a single string — one row, one origin kind.
- `class` is a **single string**. Classes are ordered by complexity so the
  higher class subsumes lower ones (e.g. `osp` already implies `graph`); a
  row gets the highest-complexity class that matches.
- No `origin`/`path` — the shard filename carries that.
- No `chunk_id` — the breadcrumb comment inside `text` carries that.
- No `n_tokens` — tokenizer-dependent, recompute in stats.
- No `hash` — dedup is out of scope.

## SFT — Supervised Fine-tuning

Chat-style, maps cleanly onto HF `apply_chat_template`.

**Required**
```json
{
  "messages": [
    {"role": "system",    "content": "..."},
    {"role": "user",      "content": "..."},
    {"role": "assistant", "content": "..."}
  ]
}
```

Multi-turn is a longer `messages` list. Same optional `meta` block as CPT.

# Scripts

Shared helpers (used by every `*2cpt` and by SFT builders):

- `io.walk_files(root, extension_filter)` — deterministic file iteration.
- `io.write_shards(rows, out_dir, split, split_name, shuffle, seed)` —
  the one place that owns splitting, shuffling, naming, and writing.
- `chunking.chunk(text, ...)` — the one chunker (see below).
- `classifier.classify(text)` — the one classifier.

Every builder below wires these together; none of them reimplements walking,
splitting, chunking, or classification.

## `build_cpt_dataset.py`

### `code2cpt`
* Usage:
```python
code2cpt("path/to/input/folder")
```
```python
code2cpt("path/to/input/folder", out_dir="../CPT/<InputFolderName>/", split=[0.8, 0.2])
```
* Input: folder path
* Output: shard directory of `jsonl` files (one per split)
* Function: convert each source file to a single row of CPT training data (no chunking)
* Optional:

| Field | Default | Format | Effect |
| ----- | ------- | ------ | ------ |
| `out_dir` | `../CPT/<InputFolderName>/` | string | Output directory; one file per split. |
| `mark_file_name` | `False` | bool | Prepend a comment with the relative path. |
| `split` | `[0.8, 0.2]` | list of float | Sum ≤ 1.0. Remainder becomes an extra split. Sum > 1.0 raises. |
| `split_name` | `["train", "valid"]` | list of string | Shorter than `split` → auto-fill `split_002`, `split_003`, … |
| `shuffle` | `False` | bool | Shuffle rows before splitting. |
| `seed` | `0` | int | Reproducible shuffle/split. |
| `extension_filter` | `["jac"]` | list of string | File extensions to include (no leading dot). |
| `classify` | `True` | bool | Fill `meta.class` via `classifier.classify`. |

### `md2cpt`
* Usage:
```python
md2cpt("path/to/input/folder")
```
```python
md2cpt("path/to/input/folder", out_dir="../CPT/<InputFolderName>/", max_tokens=4096)
```
* Input: folder path
* Output: shard directory of `jsonl` files
* Function: walk `.md` files, chunk long ones via `chunking.chunk(boundary="markdown")`, emit one row per chunk
* Optional:

| Field | Default | Format | Effect |
| ----- | ------- | ------ | ------ |
| `out_dir` | `../CPT/<InputFolderName>/` | string | Output directory. |
| `split` | `[0.8, 0.2]` | list of float | Sum ≤ 1.0; remainder auto-added; sum > 1.0 raises. |
| `split_name` | `["train", "valid"]` | list of string | Auto-fills `split_00N` if shorter than `split`. |
| `shuffle` | `False` | bool | Shuffle rows before splitting. |
| `seed` | `0` | int | Reproducible shuffle/split. |
| `extension_filter` | `["md"]` | list of string | File extensions. |
| `max_tokens` | `4096` | int | Soft cap per chunk. |
| `tokenizer` | `"gpt2"` | string | Tokenizer used only for the chunk-size count. |
| `header_comment` | `True` | bool | Prepend breadcrumb comment on chunks. |
| `classify` | `True` | bool | Fill `meta.class`. |

### `html2cpt`
* Usage:
```python
html2cpt("path/to/input/folder")
```
```python
html2cpt("path/to/input/folder", strip_tags=["script", "style", "nav", "footer"])
```
* Input: folder path
* Output: shard directory of `jsonl` files
* Function: strip HTML noise (tags, scripts, styles), unwrap remaining markup to text, then walk → chunk → row as in `md2cpt`
* Optional:

| Field | Default | Format | Effect |
| ----- | ------- | ------ | ------ |
| `out_dir` | `../CPT/<InputFolderName>/` | string | Output directory. |
| `split` | `[0.8, 0.2]` | list of float | Sum ≤ 1.0; remainder auto-added; sum > 1.0 raises. |
| `split_name` | `["train", "valid"]` | list of string | Auto-fills `split_00N`. |
| `shuffle` | `False` | bool | Shuffle rows before splitting. |
| `seed` | `0` | int | Reproducible shuffle/split. |
| `extension_filter` | `["html", "htm"]` | list of string | File extensions. |
| `max_tokens` | `4096` | int | Soft cap per chunk. |
| `tokenizer` | `"gpt2"` | string | Chunk-size tokenizer. |
| `header_comment` | `True` | bool | Prepend breadcrumb. |
| `strip_tags` | `["script", "style", "nav", "footer"]` | list of string | Tags removed entirely (children discarded). |
| `strip_selectors` | `[]` | list of string | Extra CSS selectors to drop. |
| `classify` | `True` | bool | Fill `meta.class`. |

### `repo2cpt`
* Usage:
```python
repo2cpt("path/to/input/folder")
```
```python
repo2cpt("path/to/input/folder", file_order=["README*", "*.toml", "*.jac", "tests/*"], max_tokens=8192)
```
* Input: folder path containing one or more repos as subdirectories
* Output: shard directory of `jsonl` files
* Function: pack each repo's files in a stable reading order with inter-file separators, chunk the packed text, emit one row per chunk; split is applied at the **repo** level so chunks from one repo never straddle train/valid
* Optional:

| Field | Default | Format | Effect |
| ----- | ------- | ------ | ------ |
| `out_dir` | `../CPT/<InputFolderName>/` | string | Output directory. |
| `split` | `[0.8, 0.2]` | list of float | Sum ≤ 1.0; remainder auto-added; sum > 1.0 raises. Applied at repo level. |
| `split_name` | `["train", "valid"]` | list of string | Auto-fills `split_00N`. |
| `shuffle` | `False` | bool | Shuffle repos before splitting. |
| `seed` | `0` | int | Reproducible shuffle/split. |
| `extension_filter` | `["jac", "md", "toml"]` | list of string | Files included in packing. |
| `file_order` | `["README*", "*.toml", "*.jac", "tests/*"]` | list of string | Glob priority list; unmatched files appended alphabetically. |
| `max_tokens` | `8192` | int | Soft chunk cap; larger than file-level builders. |
| `tokenizer` | `"gpt2"` | string | Chunk-size tokenizer. |
| `separator` | `"# ==== file: {path} ==== #"` | string | Inter-file marker; `{path}` is repo-relative. |
| `header_comment` | `True` | bool | Prepend breadcrumb on chunks. |
| `classify` | `True` | bool | Fill `meta.class`. |

## `chunking.py`

### `chunk`
* Usage:
```python
chunk(text)
```
```python
chunk(text, max_tokens=4096, boundary="markdown", overlap_tokens=0)
```
* Input: a string
* Output: list of strings (chunks), each ≤ `max_tokens`
* Function: recursively split on the strongest available boundary (heading / top-level def / line), prepending a breadcrumb comment so a chunk is self-locating
* Optional:

| Field | Default | Format | Effect |
| ----- | ------- | ------ | ------ |
| `max_tokens` | `4096` | int | Soft cap; chunker prefers earlier boundaries. |
| `boundary` | `"markdown"` | string | `markdown` (H1→H6), `code` (top-level defs), `line` (fallback). |
| `header_comment` | `True` | bool | Prepend the breadcrumb as a comment. |
| `overlap_tokens` | `0` | int | Optional token overlap between adjacent chunks. |
| `tokenizer` | `"gpt2"` | string | Used only for the token count. |

Breadcrumb format:
```
<!-- <FILENAME>/<HEADING 1>/<HEADING 2>/<HEADING 3>/<CHUNK N> -->
```
Comment syntax per file type: `<!-- -->` for md/html, `#` for Jac/Python.

## `classifier.py`

### `classify` (naive keyword / regex)
* Usage:
```python
classify(text)
```
* Input: a string
* Output: a single class name (string)
* Function: check signals in complexity order; first match wins; higher classes subsume lower ones

| priority | class | signal |
| -------- | ----- | ------ |
| 1 (highest) | `fullstack` | `JSX`, `client_kind`, `@jac/`, `useState` |
| 2 | `osp` | `\bwalker\b`, `\bspawn\b`, `visit\s` |
| 3 | `graph` | `\bnode\b`, `\bedge\b`, `++>`, `-->`, `<++`, `<--` |
| 4 (fallback) | `function` | none of the above |

### `compiler`
Use `jac check --json` (or the AST) to tag:
- did it parse?
- does it declare walkers / nodes / edges / endpoints?
- top-level archetype histogram.

More reliable than regex once we have it; regex stays as the fast path.

## `jsonl2parquet.py`

### `jsonl2parquet`
* Usage:
```python
jsonl2parquet("path/to/CPT/<name>/")
```
* Input: a shard directory of `.jsonl` files
* Output: sibling `.parquet` files (one per split) plus a `dataset_info.json`
* Function: once a dataset is frozen, convert to Parquet for smaller/faster loading; `dataset_info.json` makes the folder loadable via `datasets.load_dataset`

## `statistic.py`

### `statistic`
* Usage:
```bash
python -m script.statistic CPT/<name>/
```
* Input: a shard directory
* Output: `<name>.md` and `<name>.json` reports next to the shard
* Function: summarize the shard — row count, token count (per configured tokenizer), length distribution (p50/p90/p99, histogram), class mix, `source` mix

# Layout

```
dataset/
├── raw/
│   └── <origin>/...
├── script/
│   ├── io.py                # walk_files, write_shards (shared)
│   ├── chunking.py          # chunk (shared)
│   ├── classifier.py        # classify (shared)
│   ├── build_cpt_dataset.py # code2cpt, md2cpt, html2cpt, repo2cpt
│   ├── build_sft_dataset.py
│   ├── jsonl2parquet.py
│   └── statistic.py
├── CPT/
│   └── <origin>/{train,valid,...}.jsonl
└── SFT/
    └── <origin>/{train,valid,...}.jsonl
```

---

# Decisions I made (vs. current README)

1. **SFT schema → `messages` list** instead of `{instruction, response}`. Enables multi-turn and tool-use; matches HF chat templates.
2. **`meta` kept minimal**: only `source` (single string) and `class` (single string). Dropped `origin`, `path`, `chunk_id`, `n_tokens`, `hash` — they either live in the filename, live in the breadcrumb comment, are tokenizer-dependent, or belong to a dedup pass we are not doing.
3. **Classifier is single-label with a complexity order** (`fullstack > osp > graph > function`); higher classes subsume lower ones.
4. **Split output is a directory**, one file per split, so HF `load_dataset` works out of the box.
5. **Split sum > 1.0 is an error**; sum < 1.0 still auto-adds the remainder.
6. **Shared `io.walk_files` and `io.write_shards`** own walking, shuffling, splitting, naming, writing — every `*2cpt` calls into them so the logic exists in exactly one place.
7. **One `chunking.chunk` function** parameterized by `boundary ∈ {markdown, code, line}` + optional overlap.
8. **`md2cpt` and `html2cpt` share a skeleton** (walk → chunk → row); `html2cpt` adds a tag-cleaning pre-pass with `strip_tags` / `strip_selectors`.
9. **`repo2cpt` is its own thing**: repo discovery, `file_order`, inter-file separator, **split-at-repo-level** so chunks from one repo don't leak across train/valid.
10. **Dropped dedup**.
11. **Every field listed inline per builder** — no "same as `code2cpt`" redirection.
