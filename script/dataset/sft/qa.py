import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.io import json2parquet
from utils.jac_block import first_jac_block
from utils.classifier import classify_structural as classify

# Setting =================================================
DS_FORMAT = "jac"
DS_NAME   = "opus-synth-v2"
SOURCE    = "agent"

DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_FILE = f"{DS_ROOT}/raw/agent-synth/sft_train.jsonl"

OUT_FORMAT = "jsonl"
VALID_SIZE = 0.2
SEED       = 3407

FP_KEY    = "id"
KEEP_META = (
    "category",
    "subtype",         # raw's task_type (renamed to avoid collision with our TASK_TYPE)
    "complexity",
    "compiler_pass",
    "test_pass",
    "seed_tier",
)

# (category, raw_task_type) -> our task-type folder. "*" matches any task within category.
ROUTES: dict[tuple[str, str], str] = {
    ("conversion", "python_to_jac_function"): "py2jac",
    ("conversion", "python_to_jac_graph"):    "py2jac",
    ("code_gen",   "*"):                      "code_gen",
}
FALLBACK_TASK = "qa"

# code_gen: derive `class` from raw task_type (mapping is authoritative).
CODE_GEN_CLASS: dict[str, str] = {
    "core_language_basics":    "function",
    "node_edge_definition":    "graph",
    "walker_traversal":        "osp",
    "graph_query_patterns":    "osp",
    "cl_component_authoring":  "fullstack",
    "sv_endpoint_authoring":   "fullstack",
}


# Functions ===============================================
def route(category: str, raw_task: str) -> str:
    """Pick our SFT task folder for a (category, raw_task_type) pair."""
    if (category, raw_task) in ROUTES:
        return ROUTES[(category, raw_task)]
    if (category, "*") in ROUTES:
        return ROUTES[(category, "*")]
    return FALLBACK_TASK


def infer_class(our_task: str, raw_task: str, messages: list) -> str | None:
    """code_gen: mapping table. py2jac: classify the first ```jac block in the
    assistant reply. qa: no class."""
    if our_task == "code_gen":
        return CODE_GEN_CLASS.get(raw_task)
    if our_task == "py2jac":
        for m in messages:
            if m.get("role") == "assistant":
                blk = first_jac_block(m.get("content", ""))
                if blk:
                    return classify(blk)
        return None
    return None


def qa2sft(in_file=IN_FILE, out_root=None, format=OUT_FORMAT):
    """Read Opus-synthesized SFT JSONL, route to task-type folders, keep
    `messages` as-is, trim meta, shuffle-split each bucket 80/20."""
    in_path  = Path(in_file)
    out_root = Path(out_root) if out_root else Path(f"{DS_ROOT}/sft")
    format   = format.lower()

    if format not in {"jsonl", "parquet"}:
        raise ValueError("format must be either 'jsonl' or 'parquet'")
    if not in_path.is_file():
        raise FileNotFoundError(f"Input file not found: {in_path}")
    if not 0 <= VALID_SIZE < 1:
        raise ValueError("VALID_SIZE must be between 0 (inclusive) and 1")

    buckets: dict[str, list[dict]] = {}
    with in_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            messages = rec.get("messages")
            if not messages:
                continue
            category  = rec.get("category", "")
            raw_task  = rec.get("task_type", "")
            our_task  = route(category, raw_task)

            meta = {
                "source":    SOURCE,
                "format":    DS_FORMAT,
                "task_type": our_task,
                "fp":        rec.get(FP_KEY) or "",
            }
            cls = infer_class(our_task, raw_task, messages)
            if cls is not None:
                meta["class"] = cls
            for k in KEEP_META:
                src_key = "task_type" if k == "subtype" else k
                if src_key in rec:
                    meta[k] = rec[src_key]

            buckets.setdefault(our_task, []).append({"messages": messages, "meta": meta})

    if not buckets:
        raise ValueError(f"No usable records in: {in_path}")

    for our_task in sorted(buckets):
        records = buckets[our_task]
        rng = random.Random(SEED)
        rng.shuffle(records)
        valid_count = int(len(records) * VALID_SIZE)
        splits = {
            "valid": records[:valid_count],
            "train": records[valid_count:],
        }

        out_dir = out_root / our_task / DS_NAME
        out_dir.mkdir(parents=True, exist_ok=True)
        for split, recs in splits.items():
            output_file = out_dir / f"{split}.jsonl"
            with output_file.open("w", encoding="utf-8") as out:
                for r in recs:
                    json.dump(r, out, ensure_ascii=False)
                    out.write("\n")

        if format == "parquet":
            json2parquet(out_dir, out_dir)

        print(
            f"[{our_task:9s}]  {len(splits['train'])} train / "
            f"{len(splits['valid'])} valid  ->  {out_dir}"
        )


# Run =====================================================
if __name__ == "__main__":
    qa2sft()
