import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))
from utils.io import iter_sources, json2parquet
from utils.classifier import classify_structural as classify

# Setting =================================================
DS_FORMAT    = "jac"
DS_NAME      = "Nitin-js2jac"
SOURCE       = "code"
TASK_TYPE    = "js2jac"
JSON_KEYWORD = "jac"  # JSONL mode: field holding the Jac target
FP_KEY       = "id"   # JSONL mode: field to use as sample id (fp)
JS_KEY       = "js"   # JSONL mode: field holding the JS/TS source

DS_ROOT = f"{Path(__file__).resolve().parent}/../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{DS_FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/sft/{TASK_TYPE}/{DS_NAME}"

PROMPT     = f"{Path(__file__).resolve().parent}/template/prompt_template.json"
OUT_FORMAT = "jsonl"
VALID_SIZE = 0.2
SEED       = 3407


# Functions ===============================================
def jsonl2js2jac(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """Turn (js, jac) pairs into SFT records with a js2jac conversion prompt."""
    in_dir = Path(in_dir)
    out_dir = Path(out_dir)
    format = format.lower()

    if format not in {"jsonl", "parquet"}:
        raise ValueError("format must be either 'jsonl' or 'parquet'")
    if not in_dir.is_dir():
        raise NotADirectoryError(f"Input directory not found: {in_dir}")
    if not 0 <= VALID_SIZE < 1:
        raise ValueError("VALID_SIZE must be between 0 (inclusive) and 1")

    raw_root = Path(f"{DS_ROOT}/raw/{DS_FORMAT}")
    samples: list[tuple[str, str, str]] = []  # (fp, js, jac)
    for fp, jac, extras in iter_sources(in_dir, raw_root, JSON_KEYWORD, FP_KEY, (JS_KEY,)):
        js = (extras.get(JS_KEY) or "").strip()
        jac = jac.strip()
        if not js or not jac:
            continue
        samples.append((fp, js, jac))
    if not samples:
        raise ValueError(f"No convertible (js, jac) pairs found in: {in_dir}")

    with Path(PROMPT).open("r", encoding="utf-8") as file:
        tpl = json.load(file)
    systems  = tpl.get("system", [])
    prefixes = tpl.get(TASK_TYPE, [])
    if not systems or not prefixes:
        raise ValueError(f"Missing 'system' or '{TASK_TYPE}' in: {PROMPT}")

    rng = random.Random(SEED)
    rng.shuffle(samples)
    valid_count = int(len(samples) * VALID_SIZE)
    splits = {
        "valid": samples[:valid_count],
        "train": samples[valid_count:],
    }

    out_dir.mkdir(parents=True, exist_ok=True)
    counts = {}
    for split, records in splits.items():
        output_file = Path(f"{out_dir}/{split}.jsonl")
        n = 0
        with output_file.open("w", encoding="utf-8") as out:
            for fp, js, jac in records:
                instruction = f"{rng.choice(prefixes)}\n```ts\n{js}\n```"
                answer      = f"```jac\n{jac}\n```"
                record = {
                    "messages": [
                        {"role": "system",    "content": rng.choice(systems)},
                        {"role": "user",      "content": instruction},
                        {"role": "assistant", "content": answer},
                    ],
                    "meta": {
                        "source": SOURCE,
                        "format": DS_FORMAT,
                        "class": classify(jac),
                        "task_type": TASK_TYPE,
                        "fp": fp,
                    },
                }
                json.dump(record, out, ensure_ascii=False)
                out.write("\n")
                n += 1
        counts[split] = n

    if format == "parquet":
        json2parquet(out_dir, out_dir)

    print(
        f"Created {counts['train']} train and {counts['valid']} validation "
        f"samples in {out_dir}"
    )


# Run =====================================================
if __name__ == "__main__":
    jsonl2js2jac()
