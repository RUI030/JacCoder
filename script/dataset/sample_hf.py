"""Sample N random rows per group from a downloaded HF dataset (parquet) into a Markdown file for review."""

import argparse, json, random, sys
from pathlib import Path

# script/dataset/{inspect,statistics}.py shadow the stdlib modules pyarrow imports
sys.path = [p for p in sys.path if Path(p or ".").resolve() != Path(__file__).resolve().parent]
import pyarrow.dataset as pads

# Setting =================================================
SEED = 3407

# Functions ===============================================
def render_value(name: str, value, code_fields: set[str], lang: str) -> str:
    """One field -> Markdown: code fields fenced in `lang`, structures as JSON, long text quoted, short text inline."""
    if isinstance(value, (list, dict)):
        return f"**{name}**\n```json\n{json.dumps(value, indent=2, ensure_ascii=False, default=str)}\n```"
    text = "" if value is None else str(value)
    if name in code_fields:
        return f"**{name}**\n```{lang}\n{text.rstrip()}\n```"
    if "\n" in text or len(text) > 100:
        quoted = "\n".join(f"> {l}" if l else ">" for l in text.strip().splitlines())
        return f"**{name}**\n\n{quoted}"     # quoted so the row's own headings don't break the outline
    return f"**{name}**: `{text}`"


def sample(data_dir: str | Path, out: str | Path, by: list[str], n: int, fields: list[str] | None,
           code_fields: set[str], lang: str, split: str | None, seed: int = SEED) -> dict[tuple, int]:
    """Pick `n` random rows for every distinct value of the `by` columns and write them as Markdown.

    Reads only the group columns to choose rows, then only `fields` for the chosen rows,
    so a multi-GB dataset with heavy columns stays cheap. `split` keeps parquet files whose
    path contains it (HF layout: data/<split>-*.parquet). Returns {group: group size}.
    """
    files = sorted(str(p) for p in Path(data_dir).rglob("*.parquet") if split is None or split in p.name)
    if not files:
        raise FileNotFoundError(f"No parquet files under {data_dir} (split={split})")
    ds = pads.dataset(files, format="parquet")

    keys    = ds.to_table(columns=by).to_pylist()
    groups: dict[tuple, list[int]] = {}
    for i, row in enumerate(keys):
        groups.setdefault(tuple(row[c] for c in by), []).append(i)

    rng    = random.Random(seed)
    picked = {g: sorted(rng.sample(idx, min(n, len(idx)))) for g, idx in sorted(groups.items(), key=lambda kv: str(kv[0]))}
    table  = ds.to_table(columns=fields).take(sorted(i for idx in picked.values() for i in idx))
    rows   = dict(zip(sorted(i for idx in picked.values() for i in idx), table.to_pylist()))

    lines = [f"# Sample: {Path(data_dir).name}", "",
             f"{len(keys):,} rows, {n} per `{'/'.join(by)}`, seed {seed}, split `{split or 'all'}`.", "",
             "| " + " | ".join(by) + " | rows |", "|" + " --- |" * (len(by) + 1)]
    lines += ["| " + " | ".join(map(str, g)) + f" | {len(groups[g]):,} |" for g in picked]
    for g, idx in picked.items():
        lines += ["", f"## {' / '.join(map(str, g))}"]
        for k, i in enumerate(idx, 1):
            lines += ["", f"### {k}. row {i}", ""]
            lines += [render_value(name, v, code_fields, lang) + "\n" for name, v in rows[i].items()]

    Path(out).parent.mkdir(parents=True, exist_ok=True)
    Path(out).write_text("\n".join(lines), encoding="utf-8")
    return {g: len(groups[g]) for g in picked}

# Run =====================================================
if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dir",    required=True, help="local HF dataset dir (hf download --local-dir)")
    ap.add_argument("--out",    required=True, help="Markdown output path")
    ap.add_argument("--by",     default="subset", help="comma-separated group columns")
    ap.add_argument("--n",      type=int, default=2, help="rows per group")
    ap.add_argument("--fields", default=None, help="comma-separated columns to show (default: all)")
    ap.add_argument("--code",   default="", help="comma-separated columns to fence as code")
    ap.add_argument("--lang",   default="python", help="fence language for --code columns")
    ap.add_argument("--split",  default="train", help="parquet filename filter; '' for all files")
    ap.add_argument("--seed",   type=int, default=SEED)
    args = ap.parse_args()

    counts = sample(args.dir, args.out, args.by.split(","), args.n,
                    args.fields.split(",") if args.fields else None,
                    set(filter(None, args.code.split(","))), args.lang, args.split or None, args.seed)
    print(f"{len(counts)} groups -> {args.out}")
