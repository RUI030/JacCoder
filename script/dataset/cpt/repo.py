import json, random, re, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.classifier import classify_structural as classify
from utils.io import json2parquet
from utils.repo import iter_repo_files

# Setting =================================================
DS_FORMAT   = "repo"
DS_NAME     = "Nitin-4repo-cpt"
SOURCE      = "code"
TARGET_CHARS = 14000   # ~4k tokens at 3.5 chars/token

DS_ROOT = str(Path(__file__).resolve().parent.parent.parent.parent / "dataset")
IN_DIR  = f"{DS_ROOT}/raw/repo"
OUT_DIR = f"{DS_ROOT}/cpt/{DS_NAME}"

OUT_FORMAT = "jsonl"
VALID_SIZE = 0.0        # CPT: no train/valid split
SEED       = 3407


# Functions ===============================================
_TOP_DECL = re.compile(
    r"^(?=\s*(?:import\b|glob\b|def(?::\w+)?\b|walker(?::\w+)?\b|"
    r"node(?::\w+)?\b|edge(?::\w+)?\b|obj(?::\w+)?\b|enum(?::\w+)?\b|"
    r"impl\b|with\s+entry\b|test\b|class\b))",
    re.MULTILINE,
)


def _split_jac_by_decl(source: str, max_chars: int) -> list[str]:
    """Split a large .jac file at top-level declaration boundaries."""
    starts = [m.start() for m in _TOP_DECL.finditer(source)]
    if len(starts) < 2:
        return _hard_split(source, max_chars)
    starts.append(len(source))
    parts: list[str] = []
    buf = ""
    for i in range(len(starts) - 1):
        seg = source[starts[i]:starts[i + 1]]
        if buf and len(buf) + len(seg) > max_chars:
            parts.append(buf); buf = seg
        else:
            buf += seg
    if buf:
        parts.append(buf)
    return [p for p in parts if p.strip()]


def _hard_split(source: str, max_chars: int) -> list[str]:
    """Fallback line-boundary split for non-Jac or decl-less content."""
    lines = source.splitlines(keepends=True)
    parts, buf, size = [], [], 0
    for line in lines:
        if size + len(line) > max_chars and buf:
            parts.append("".join(buf)); buf, size = [], 0
        buf.append(line); size += len(line)
    if buf:
        parts.append("".join(buf))
    return parts


def _file_pieces(path: Path, source: str, max_chars: int) -> list[str]:
    if len(source) <= max_chars:
        return [source]
    if path.suffix == ".jac":
        return _split_jac_by_decl(source, max_chars)
    return _hard_split(source, max_chars)


def build_repo_chunks(repo_root: Path, target_chars: int) -> list[dict]:
    """Pack files under `repo_root` into <=target_chars chunks with headers.

    Each chunk starts with `# repo: <name>` and prefixes every included file
    with `# file: <relpath>`. Files larger than `target_chars` are split at
    top-level decls (.jac) or line boundaries (everything else).
    """
    repo_name = repo_root.name
    chunks: list[dict] = []
    cur_body: list[str] = []
    cur_files: list[str] = []
    cur_size = 0

    def flush():
        nonlocal cur_body, cur_files, cur_size
        if not cur_body:
            return
        header = f"# repo: {repo_name}\n"
        chunks.append({
            "text": header + "".join(cur_body),
            "files": list(cur_files),
        })
        cur_body, cur_files, cur_size = [], [], 0

    for path in iter_repo_files(repo_root):
        try:
            source = path.read_text(encoding="utf-8")
        except (UnicodeDecodeError, OSError):
            continue
        if not source.strip():
            continue
        rel = path.relative_to(repo_root).as_posix()
        for piece in _file_pieces(path, source, target_chars):
            block = f"\n# file: {rel}\n{piece.rstrip()}\n"
            if cur_size and cur_size + len(block) > target_chars:
                flush()
            cur_body.append(block)
            cur_files.append(rel)
            cur_size += len(block)
    flush()
    return chunks


def repo2cpt(in_dir=IN_DIR, out_dir=OUT_DIR, format=OUT_FORMAT):
    """Emit one CPT record per packed chunk across every repo under `in_dir`."""
    in_dir = Path(in_dir)
    out_dir = Path(out_dir)
    format = format.lower()

    if format not in {"jsonl", "parquet"}:
        raise ValueError("format must be either 'jsonl' or 'parquet'")
    if not in_dir.is_dir():
        raise NotADirectoryError(f"Input directory not found: {in_dir}")

    repos = sorted(p for p in in_dir.iterdir() if p.is_dir())
    if not repos:
        raise FileNotFoundError(f"No repos found in: {in_dir}")

    samples: list[tuple[str, dict]] = []  # (fp, record)
    for repo_root in repos:
        chunks = build_repo_chunks(repo_root, TARGET_CHARS)
        for i, ch in enumerate(chunks):
            fp = f"{repo_root.name}::chunk_{i:04d}"
            samples.append((fp, ch))

    rng = random.Random(SEED)
    rng.shuffle(samples)
    valid_count = int(len(samples) * VALID_SIZE)
    splits = {
        "valid": samples[:valid_count],
        "train": samples[valid_count:],
    }

    out_dir.mkdir(parents=True, exist_ok=True)
    for split, records in splits.items():
        if not records:
            continue
        output_file = Path(f"{out_dir}/{split}.jsonl")
        with output_file.open("w", encoding="utf-8") as out:
            for fp, ch in records:
                record = {
                    "text": ch["text"],
                    "meta": {
                        "source": SOURCE,
                        "format": DS_FORMAT,
                        "class": classify(ch["text"]),
                        "fp": fp,
                        "files": ch["files"],
                        "chars": len(ch["text"]),
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
        case "repo":
            repo2cpt()
        case _:
            raise ValueError(f"Dataset format not supported: {DS_FORMAT}")
