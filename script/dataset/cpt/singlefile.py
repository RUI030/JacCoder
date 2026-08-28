import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.io import iter_sources, json2parquet
from utils.classifier import classify_structural as classify

# Setting =================================================
DS_FORMAT    = "jac"  # or "markdown", "repo", "diff", "session"
DS_NAME      = "Nitin-js2jac"
SOURCE       = "code"  # "code", "docs", "article", "agent", "other"
JSON_KEYWORD = "jac"   # JSONL mode: field holding the Jac source
FP_KEY       = "id"    # JSONL mode: field to use as sample id (fp)

DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{DS_FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/cpt/{DS_NAME}"

PROMPT     = f"{Path(__file__).resolve().parent}/../template/prompt_template.json"
OUT_FORMAT = "jsonl"  # or "parquet"
VALID_SIZE = 0.2
SEED       = 3407

# Functions ===============================================
def jac2cpt(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """
    Convert Jac files (or a JSONL field) into reproducible CPT splits.

    Prefixes each sample with a randomly selected Jac-language comment,
    writes JSONL, then optionally converts to Parquet.
    """
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
    samples  = [
        (fp, jac.strip())
        for fp, jac, _ in iter_sources(in_dir, raw_root, JSON_KEYWORD, FP_KEY)
    ]
    if not samples:
        raise FileNotFoundError(f"No samples found in: {in_dir}")

    with Path(PROMPT).open("r", encoding="utf-8") as file:
        prompts = json.load(file).get("cpt_jac", [])
    if not prompts:
        raise ValueError(f"No CPT prompts found in: {PROMPT}")

    rng = random.Random(SEED)
    rng.shuffle(samples)
    valid_count = int(len(samples) * VALID_SIZE)
    splits = {
        "valid": samples[:valid_count],
        "train": samples[valid_count:],
    }

    out_dir.mkdir(parents=True, exist_ok=True)
    for split, records in splits.items():
        output_file = Path(f"{out_dir}/{split}.jsonl")
        with output_file.open("w", encoding="utf-8") as out:
            for fp, jac in records:
                record = {
                    "text": f"{rng.choice(prompts)}\n# from: {fp}\n{jac}\n",
                    "meta": {
                        "source": SOURCE,
                        "format": "jac",
                        "class": classify(jac),
                        "fp": fp,
                    },
                }
                json.dump(record, out, ensure_ascii=False)
                out.write("\n")

    if format == "parquet":
        json2parquet(out_dir, out_dir)

    print(
        f"Created {len(splits['train'])} train and "
        f"{len(splits['valid'])} validation samples in {out_dir}"
    )


# Run =====================================================
if __name__ == "__main__":
    match DS_FORMAT:
        case "jac":
            jac2cpt()
        case _:
            raise ValueError(f"Dataset format not supported: {DS_FORMAT}")
