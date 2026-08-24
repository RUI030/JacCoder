import json, random, re, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))
from utils.io import iter_sources, json2parquet
from utils.classifier import classify_structural as classify

# Setting =================================================
DS_FORMAT    = "jac"
DS_NAME      = "Nitin-10k-jac-functions"
SOURCE       = "code"
TASK_TYPE    = "code_completion"
JSON_KEYWORD = "jac"  # JSONL mode: field holding the Jac source
FP_KEY       = "id"   # JSONL mode: field to use as sample id (fp)

DS_ROOT = f"{Path(__file__).resolve().parent}/../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{DS_FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/sft/{TASK_TYPE}/{DS_NAME}"

PROMPT     = f"{Path(__file__).resolve().parent}/template/prompt_template.json"
OUT_FORMAT = "jsonl"
VALID_SIZE = 0.2
SEED       = 3407

DEF_RE = re.compile(r"^\s*def\s+\w+", re.M)

# Functions ===============================================
def split_at_def(source: str) -> tuple[str, str] | None:
    """Return (instruction_part, full_source) if a `def` line exists, else None.

    Instruction part = everything above the first `def` line PLUS the signature
    up to and including the opening `{`. Answer = the full source.
    """
    match = DEF_RE.search(source)
    if not match:
        return None
    brace = source.find("{", match.end())
    if brace == -1:
        return None
    head = source[: brace + 1].rstrip()
    return head, source.strip()


def jac2code_completion(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """Turn each Jac function file into an SFT record: docstring/signature-lead
    instruction with a sampled prefix; answer is the full file in a ```jac block."""
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
        tpl = json.load(file)
    systems = tpl.get("system", [])
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
            for fp, jac in records:
                parts = split_at_def(jac)
                if parts is None:
                    continue
                head, full = parts
                instruction = f"{rng.choice(prefixes)}\n{head}".strip()
                answer = f"```jac\n{full}\n```"
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
    match DS_FORMAT:
        case "jac":
            jac2code_completion()
        case _:
            raise ValueError(f"Dataset format not supported: {DS_FORMAT}")
