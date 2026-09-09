import random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.classifier    import classify_structural as classify
from dataset.parser.repo import iter_repo_files, strip_bodies
from dataset.pipeline    import load_prompts, report, split_and_write

# Setting =================================================
DS_FORMAT = "repo"
DS_NAME   = "Nitin-4repo-scaffold"
SOURCE    = "code"
TASK_TYPE = "scaffold2impl"
FP_KEY    = "id"

DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/repo"
OUT_DIR = f"{DS_ROOT}/sft/{TASK_TYPE}/{DS_NAME}"

PROMPT     = f"{Path(__file__).resolve().parent}/../template/prompt_template.json"
OUT_FORMAT = "jsonl"
VALID_SIZE = 0.2
SEED       = 3407
MIN_CHARS  = 120                        # skip trivial files (tiny stubs)

# Functions ===============================================
def build_record(fp: str, scaffold: str, impl: str,
                 prompts: dict, rng: random.Random) -> dict:
    instruction = f"{rng.choice(prompts[TASK_TYPE])}\n\n```jac\n{scaffold}\n```"
    answer      = f"```jac\n{impl}\n```"
    return {
        "messages": [
            {"role": "system",    "content": rng.choice(prompts["system"])},
            {"role": "user",      "content": instruction},
            {"role": "assistant", "content": answer},
        ],
        "meta": {
            "source":    SOURCE,
            "format":    DS_FORMAT,
            "class":     classify(impl),
            "task_type": TASK_TYPE,
            "fp":        fp,
        },
    }

def repo2scaffold2impl(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """One SFT record per non-trivial `.jac` file: scaffold in, implementation out."""
    in_dir  = Path(in_dir)
    out_dir = Path(out_dir)
    format  = format.lower()

    repos = sorted(p for p in in_dir.iterdir() if p.is_dir())
    if not repos:
        raise FileNotFoundError(f"No repos found in: {in_dir}")

    samples: list[tuple[str, str, str]] = []
    for repo_root in repos:
        for path in iter_repo_files(repo_root):
            if path.suffix != ".jac":
                continue
            try:
                source = path.read_text(encoding="utf-8").strip()
            except (UnicodeDecodeError, OSError):
                continue
            if len(source) < MIN_CHARS:
                continue
            scaffold = strip_bodies(source).strip()
            if scaffold == source or "{ ... }" not in scaffold:
                continue                # nothing to fill; skip
            rel = path.relative_to(repo_root).as_posix()
            samples.append((f"{repo_root.name}::{rel}", scaffold, source))
    if not samples:
        raise FileNotFoundError(f"No fillable Jac scaffolds found under: {in_dir}")

    prompts = load_prompts(PROMPT, "system", TASK_TYPE)
    rng     = random.Random(SEED)
    rng.shuffle(samples)
    records = [build_record(fp, sc, im, prompts, rng) for fp, sc, im in samples]

    counts = split_and_write(records, out_dir, VALID_SIZE, format)
    report(counts, out_dir)

# Run =====================================================
if __name__ == "__main__":
    repo2scaffold2impl()
