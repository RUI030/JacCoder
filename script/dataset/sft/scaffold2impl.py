import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.classifier import classify_structural as classify
from utils.io import json2parquet
from utils.repo import iter_repo_files, strip_bodies

# Setting =================================================
DS_FORMAT   = "repo"
DS_NAME     = "Nitin-4repo-scaffold"
SOURCE      = "code"
TASK_TYPE   = "scaffold2impl"

DS_ROOT = str(Path(__file__).resolve().parent.parent.parent.parent / "dataset")
IN_DIR  = f"{DS_ROOT}/raw/repo"
OUT_DIR = f"{DS_ROOT}/sft/{TASK_TYPE}/{DS_NAME}"

PROMPT      = f"{Path(__file__).resolve().parent}/../template/prompt_template.json"
OUT_FORMAT  = "jsonl"
VALID_SIZE  = 0.2
SEED        = 3407
MIN_CHARS   = 120   # skip trivial files (tiny stubs, near-empty modules)


# Functions ===============================================
def repo2scaffold2impl(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """One SFT record per non-trivial `.jac` file: scaffold in, implementation out."""
    in_dir = Path(in_dir)
    out_dir = Path(out_dir)
    format = format.lower()

    if format not in {"jsonl", "parquet"}:
        raise ValueError("format must be either 'jsonl' or 'parquet'")
    if not in_dir.is_dir():
        raise NotADirectoryError(f"Input directory not found: {in_dir}")
    if not 0 <= VALID_SIZE < 1:
        raise ValueError("VALID_SIZE must be between 0 (inclusive) and 1")

    repos = sorted(p for p in in_dir.iterdir() if p.is_dir())
    if not repos:
        raise FileNotFoundError(f"No repos found in: {in_dir}")

    samples: list[tuple[str, str, str]] = []  # (fp, scaffold, impl)
    for repo_root in repos:
        for path in iter_repo_files(repo_root):
            if path.suffix != ".jac":
                continue
            try:
                source = path.read_text(encoding="utf-8")
            except (UnicodeDecodeError, OSError):
                continue
            source = source.strip()
            if len(source) < MIN_CHARS:
                continue
            scaffold = strip_bodies(source).strip()
            if scaffold == source or "{ ... }" not in scaffold:
                continue  # nothing to fill; skip
            rel = path.relative_to(repo_root).as_posix()
            fp  = f"{repo_root.name}::{rel}"
            samples.append((fp, scaffold, source))
    if not samples:
        raise FileNotFoundError(f"No fillable Jac scaffolds found under: {in_dir}")

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
            for fp, scaffold, impl in records:
                instruction = f"{rng.choice(prefixes)}\n\n```jac\n{scaffold}\n```"
                answer      = f"```jac\n{impl}\n```"
                record = {
                    "messages": [
                        {"role": "system",    "content": rng.choice(systems)},
                        {"role": "user",      "content": instruction},
                        {"role": "assistant", "content": answer},
                    ],
                    "meta": {
                        "source": SOURCE,
                        "format": DS_FORMAT,
                        "class": classify(impl),
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
    repo2scaffold2impl()
