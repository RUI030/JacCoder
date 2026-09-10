import random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.io         import iter_sources
from utils.classifier import classify_structural as classify
from dataset.pipeline import load_prompts, report, split_and_write

# Setting =================================================
DS_FORMAT    = "jac"                    # or "markdown", "repo", "diff", "session"
DS_NAME      = "Nitin-9k-py2jac-idiom"
SOURCE       = "code"                   # "code", "docs", "article", "agent", "other"
JSON_KEYWORD = "jac"                    # JSONL mode: field holding the Jac source
FP_KEY       = "id"                     # JSONL mode: field to use as sample id (fp)

DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{DS_FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/cpt/{DS_NAME}"

PROMPT     = f"{Path(__file__).resolve().parent}/../template/prompt_template.json"
OUT_FORMAT = "jsonl"                    # or "parquet"
VALID_SIZE = 0.2
SEED       = 3407

# Functions ===============================================
def build_record(fp: str, jac: str, prompts: dict, rng: random.Random) -> dict:
    """Prefix a random Jac-language comment + source ref, wrap as CPT record."""
    return {
        "text": f"{rng.choice(prompts['cpt_jac'])}\n# from: {fp}\n{jac}\n",
        "meta": {
            "source": SOURCE,
            "format": "jac",
            "class":  classify(jac),
            "fp":     fp,
        },
    }

def jac2cpt(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """Convert Jac files (or a JSONL field) into reproducible CPT splits."""
    in_dir  = Path(in_dir)
    out_dir = Path(out_dir)
    format  = format.lower()

    raw_root = Path(f"{DS_ROOT}/raw/{DS_FORMAT}")
    samples  = [
        (fp, jac.strip())
        for fp, jac, _ in iter_sources(in_dir, raw_root, JSON_KEYWORD, FP_KEY)
    ]
    if not samples:
        raise FileNotFoundError(f"No samples found in: {in_dir}")

    prompts = load_prompts(PROMPT, "cpt_jac")
    rng     = random.Random(SEED)
    rng.shuffle(samples)
    records = [build_record(fp, jac, prompts, rng) for fp, jac in samples]

    counts = split_and_write(records, out_dir, VALID_SIZE, format)
    report(counts, out_dir)

# Run =====================================================
if __name__ == "__main__":
    match DS_FORMAT:
        case "jac":
            jac2cpt()
        case _:
            raise ValueError(f"Dataset format not supported: {DS_FORMAT}")
