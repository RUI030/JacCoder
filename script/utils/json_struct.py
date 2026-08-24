"""Inspect a JSONL file and print/save the structural schema.

Usage:
    python script/utils/json_struct.py --in path/to/data.jsonl [--out schema.json]
    from utils.json_struct import inspect_jsonl
"""

import argparse, json
from pathlib import Path
from statistics import mean, median

# Setting =================================================
JSONL_FP = ""     # required if not passed via --in
OUT_FP   = None   # None => print only, no file save
SAMPLE_N = 200    # records to sample when profiling; 0 => scan all
PREVIEW  = 80     # chars to preview per string value


# Functions ===============================================
def _type_name(v) -> str:
    if v is None:
        return "null"
    if isinstance(v, bool):
        return "bool"
    if isinstance(v, int):
        return "int"
    if isinstance(v, float):
        return "float"
    if isinstance(v, str):
        return "str"
    if isinstance(v, list):
        return "list"
    if isinstance(v, dict):
        return "dict"
    return type(v).__name__


def _summarize_string(values: list[str]) -> dict:
    lengths = [len(v) for v in values]
    return {
        "type": "str",
        "n": len(values),
        "len_min":    min(lengths),
        "len_max":    max(lengths),
        "len_avg":    round(mean(lengths), 1),
        "len_median": int(median(lengths)),
    }


def _summarize_list(values: list[list]) -> dict:
    lengths = [len(v) for v in values]
    inner_types = sorted({_type_name(x) for v in values for x in v})
    return {
        "type":  "list",
        "n":     len(values),
        "elem":  inner_types,
        "len_min":    min(lengths),
        "len_max":    max(lengths),
        "len_avg":    round(mean(lengths), 1),
        "len_median": int(median(lengths)),
    }


def _summarize_scalar(values: list) -> dict:
    tset = sorted({_type_name(v) for v in values})
    uniq = {v for v in values if isinstance(v, (int, float, bool, str)) or v is None}
    out = {"type": tset[0] if len(tset) == 1 else tset, "n": len(values)}
    if len(uniq) <= 10:
        out["unique"] = sorted(uniq, key=lambda x: (x is None, str(x)))
    else:
        out["unique_n"] = len(uniq)
    return out


def _summarize_dict(values: list[dict]) -> dict:
    keys = sorted({k for v in values for k in v})
    return {"type": "dict", "n": len(values), "keys": keys}


def _summarize_field(values: list) -> dict:
    types = {_type_name(v) for v in values}
    if types == {"str"}:
        return _summarize_string(values)
    if types == {"list"}:
        return _summarize_list(values)
    if types == {"dict"}:
        return _summarize_dict(values)
    return _summarize_scalar(values)


def inspect_jsonl(fp, sample_n: int = SAMPLE_N, preview: int = PREVIEW) -> dict:
    """Return a schema dict describing one JSONL file's record structure."""
    fp = Path(fp)
    if not fp.is_file():
        raise FileNotFoundError(f"Not a file: {fp}")

    total = 0
    fields: dict[str, list] = {}
    first_record = None
    with fp.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            total += 1
            if sample_n and total > sample_n:
                continue
            rec = json.loads(line)
            if first_record is None:
                first_record = rec
            for k, v in rec.items():
                fields.setdefault(k, []).append(v)

    schema = {
        "file":     str(fp),
        "records":  total,
        "sampled":  min(total, sample_n) if sample_n else total,
        "fields":   {k: _summarize_field(v) for k, v in fields.items()},
        "example":  {
            k: (v[:preview] + "…") if isinstance(v, str) and len(v) > preview else v
            for k, v in (first_record or {}).items()
        },
    }
    return schema


def print_schema(schema: dict) -> None:
    print(f"File:    {schema['file']}")
    print(f"Records: {schema['records']}  (sampled {schema['sampled']})")
    print("Fields:")
    for k, info in schema["fields"].items():
        t = info.get("type")
        extras = []
        for key in ("n", "len_min", "len_max", "len_avg",
                    "elem", "keys", "unique", "unique_n"):
            if key in info:
                extras.append(f"{key}={info[key]}")
        print(f"  {k:20s} type={t}  " + "  ".join(extras))
    print("Example record:")
    print(json.dumps(schema["example"], indent=2, ensure_ascii=False))


# Run =====================================================
def main():
    parser = argparse.ArgumentParser(description="Inspect a JSONL file's schema.")
    parser.add_argument("--in",  dest="in_fp",  default=None, help="input JSONL path")
    parser.add_argument("--out", dest="out_fp", default=None, help="output JSON path (default: print only)")
    parser.add_argument("--sample", type=int, default=SAMPLE_N, help="max records to profile (0 = all)")
    args = parser.parse_args()

    in_fp  = args.in_fp  if args.in_fp  is not None else JSONL_FP
    out_fp = args.out_fp if args.out_fp is not None else OUT_FP
    if not in_fp:
        raise SystemExit("Provide --in or set JSONL_FP")

    schema = inspect_jsonl(in_fp, sample_n=args.sample)
    print_schema(schema)

    if out_fp:
        Path(out_fp).parent.mkdir(parents=True, exist_ok=True)
        Path(out_fp).write_text(json.dumps(schema, indent=2, ensure_ascii=False))
        print(f"\nWrote schema: {out_fp}")


if __name__ == "__main__":
    main()
