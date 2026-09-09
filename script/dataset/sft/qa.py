import json, random, sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.jac_block  import first_jac_block
from utils.classifier import classify_structural as classify
from dataset.pipeline import report, split_and_write

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
    "subtype",                          # raw's task_type (renamed to avoid TASK_TYPE collision)
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


def build_record(rec: dict) -> tuple[str, dict] | None:
    """Route one raw row → (our_task, envelope-record). Returns None to skip."""
    messages = rec.get("messages")
    if not messages:
        return None
    category = rec.get("category", "")
    raw_task = rec.get("task_type", "")
    our_task = route(category, raw_task)

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

    return our_task, {"messages": messages, "meta": meta}


def qa2sft(in_file=IN_FILE, out_root=None, format=OUT_FORMAT):
    """Read Opus-synthesized SFT JSONL, route to task-type folders, keep
    `messages` as-is, trim meta, shuffle-split each bucket 80/20."""
    in_path  = Path(in_file)
    out_root = Path(out_root) if out_root else Path(f"{DS_ROOT}/sft")
    format   = format.lower()

    buckets: dict[str, list[dict]] = {}
    with in_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            built = build_record(json.loads(line))
            if built is None:
                continue
            our_task, rec = built
            buckets.setdefault(our_task, []).append(rec)

    if not buckets:
        raise ValueError(f"No usable records in: {in_path}")

    for our_task in sorted(buckets):
        rng = random.Random(SEED)
        rng.shuffle(buckets[our_task])
        out_dir = out_root / our_task / DS_NAME
        counts  = split_and_write(buckets[our_task], out_dir, VALID_SIZE, format)
        print(f"[{our_task:9s}]  {counts.get('train', 0)} train / "
              f"{counts.get('valid', 0)} valid  ->  {out_dir}")


# Run =====================================================
if __name__ == "__main__":
    qa2sft()
