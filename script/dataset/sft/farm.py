import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.io import json2parquet
from utils.classifier import classify_structural as classify

# Setting =================================================
DS_FORMAT    = "jac"
DS_NAME      = "Nitin-2k-farm"
SOURCE       = "agent"
TASK_TYPE    = "farm"
FP_KEY       = "id"

DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{DS_FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/sft/{TASK_TYPE}/{DS_NAME}"

PROMPT     = f"{Path(__file__).resolve().parent}/../template/prompt_template.json"
OUT_FORMAT = "jsonl"
VALID_SIZE = 0.2
SEED       = 3407


# Functions ===============================================
def jsonl2farm(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """Build (schema, target-node) -> CRUD-walkers SFT records.

    Each source row supplies `archetype` (full node/edge schema), a target
    `node` name, and `walkers` (a public CRUD walker set for that node).
    We synthesize a user instruction from the schema and target-node name,
    and the assistant answer is the walker block wrapped in ```jac ... ```.
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

    samples = []  # (fp, archetype, node, walkers)
    for jf in sorted(in_dir.rglob("*.jsonl")):
        with jf.open("r", encoding="utf-8") as f:
            for idx, line in enumerate(f):
                line = line.strip()
                if not line:
                    continue
                rec = json.loads(line)
                archetype = (rec.get("archetype") or "").strip()
                walkers   = (rec.get("walkers") or "").strip()
                node      = (rec.get("node") or "").strip()
                if not (archetype and walkers and node):
                    continue
                fp = rec.get(FP_KEY) or f"{jf.name}#{idx}"
                samples.append((fp, archetype, node, walkers))
    if not samples:
        raise FileNotFoundError(f"No samples found in: {in_dir}")

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
            for fp, archetype, node, walkers in records:
                prefix      = rng.choice(prefixes).format(node=node)
                instruction = f"{prefix}\n\n```jac\n{archetype}\n```"
                answer      = f"```jac\n{walkers}\n```"
                record = {
                    "messages": [
                        {"role": "system",    "content": rng.choice(systems)},
                        {"role": "user",      "content": instruction},
                        {"role": "assistant", "content": answer},
                    ],
                    "meta": {
                        "source": SOURCE,
                        "format": DS_FORMAT,
                        "class": classify(walkers),
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
    jsonl2farm()
