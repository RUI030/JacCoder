import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.io import iter_sources, json2parquet
from utils.classifier import classify_structural as classify

# Setting =================================================
DS_FORMAT    = "jac"
DS_NAME      = "Nitin-1k-osp"
SOURCE       = "agent"
TASK_TYPE    = "osp"
FP_KEY       = "id"       # JSONL mode: field to use as sample id (fp)

DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{DS_FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/sft/{TASK_TYPE}/{DS_NAME}"

OUT_FORMAT = "jsonl"
VALID_SIZE = 0.2
SEED       = 3407


# Functions ===============================================
def _extract_assistant_jac(messages) -> str:
    """Return the Jac source from the last assistant turn (unwrap ```jac...```)."""
    for m in reversed(messages):
        if m.get("role") == "assistant":
            content = m.get("content", "")
            if "```" in content:
                parts = content.split("```")
                for i in range(1, len(parts), 2):
                    seg = parts[i]
                    if seg.startswith("jac"):
                        seg = seg[3:]
                    return seg.strip()
            return content
    return ""


def jsonl2osp(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """Pass osp `messages` rows through with an 80/20 train/valid split.

    The source rows are already SFT-shaped (user prompt + assistant ```jac```
    answer) and validator-gated (`compiler_pass=True, test_pass=True`); this
    script only adds the JacCoder `meta` block and splits.
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

    samples = []  # (fp, messages, jac_code_for_classify)
    for jf in sorted(in_dir.rglob("*.jsonl")):
        with jf.open("r", encoding="utf-8") as f:
            for idx, line in enumerate(f):
                line = line.strip()
                if not line:
                    continue
                rec = json.loads(line)
                messages = rec.get("messages") or []
                if not messages:
                    continue
                fp = rec.get(FP_KEY) or f"{jf.name}#{idx}"
                jac_code = _extract_assistant_jac(messages)
                if not jac_code:
                    continue
                samples.append((fp, messages, jac_code))
    if not samples:
        raise FileNotFoundError(f"No samples found in: {in_dir}")

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
            for fp, messages, jac_code in records:
                record = {
                    "messages": messages,
                    "meta": {
                        "source": SOURCE,
                        "format": DS_FORMAT,
                        "class": classify(jac_code),
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
    jsonl2osp()
