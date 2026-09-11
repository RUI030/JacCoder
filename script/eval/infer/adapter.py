import argparse, json, sys
from pathlib import Path
from datetime import datetime

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.model import load_model, generate_batched

# Setting =================================================
TASK_TYPE     = "code_completion"
DS_NAME       = "Nitin-9k-py2jac-idiom"
SPLIT         = "valid"

BASE_MODEL    = "ornith-ai/Ornith-1.5-9B"
ADAPTER_PATH  = ""  # empty => base model only

MAX_SEQ_LENGTH     = 16384
LOAD_IN_4BIT       = True
MAX_NEW_TOKENS     = 2048
TEMPERATURE        = 0.0
TOP_P              = 0.9
REPETITION_PENALTY = 1.05
ENABLE_THINKING    = False
BATCH_SIZE         = 4    # eval-time batched generation; higher = faster but more VRAM

LIMIT = 5  # 0 => all records

# CLI overrides ============================================
cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--task", "--task-type", dest="task")
cli.add_argument("--ds", "--dataset", dest="ds")
cli.add_argument("--split", dest="split")
cli.add_argument("--adapter", "--adapter-path", dest="adapter")
cli.add_argument("--limit", type=int)
args, _ = cli.parse_known_args()
if args.task:    TASK_TYPE    = args.task
if args.ds:      DS_NAME      = args.ds
if args.split:   SPLIT        = args.split
if args.adapter is not None: ADAPTER_PATH = args.adapter
if args.limit is not None:   LIMIT        = args.limit

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent
IN_FILE  = f"{PROJECT_ROOT}/dataset/sft/{TASK_TYPE}/{DS_NAME}/{SPLIT}.jsonl"
TAG      = Path(ADAPTER_PATH).parent.name if ADAPTER_PATH else BASE_MODEL.replace("/", "_")
STAMP    = datetime.now().strftime("%m-%d_%H-%M")
OUT_DIR  = f"{PROJECT_ROOT}/output/eval/{TASK_TYPE}/{DS_NAME}/{TAG}_{STAMP}"
OUT_FILE = f"{OUT_DIR}/predictions.jsonl"


# Functions ===============================================
def generate_predictions(model, tokenizer, in_file, out_file, limit=0):
    """Given a preloaded model+tokenizer, write predictions.jsonl for one split.

    Extracted from run_inference so a batch driver (eval_batch.py) can load
    the model once and iterate over multiple task/ds pairs without paying
    the model-load cost each time.
    """
    in_path  = Path(in_file)
    out_path = Path(out_file)
    if not in_path.is_file():
        raise FileNotFoundError(f"Input split not found: {in_path}")
    out_path.parent.mkdir(parents=True, exist_ok=True)

    def flush_batch(batch, dst):
        if not batch:
            return 0
        replies = generate_batched(
            model, tokenizer, [b["messages"] for b in batch],
            max_new_tokens=MAX_NEW_TOKENS,
            temperature=TEMPERATURE,
            top_p=TOP_P,
            repetition_penalty=REPETITION_PENALTY,
            enable_thinking=ENABLE_THINKING,
        )
        for entry, reply in zip(batch, replies):
            out = {
                "id": entry["idx"],
                "prediction": reply,
                "reference": entry["reference"],
                "meta": entry["meta"],
            }
            json.dump(out, dst, ensure_ascii=False)
            dst.write("\n")
        dst.flush()
        return len(batch)

    n = 0
    pending: list[dict] = []
    with in_path.open("r", encoding="utf-8") as src, \
         out_path.open("w", encoding="utf-8") as dst:
        for idx, line in enumerate(src):
            if limit and n + len(pending) >= limit:
                break
            rec = json.loads(line)
            pending.append({
                "idx": idx,
                "messages": [m for m in rec["messages"] if m["role"] != "assistant"],
                "reference": next(
                    (m["content"] for m in rec["messages"] if m["role"] == "assistant"),
                    "",
                ),
                "meta": rec.get("meta", {}),
            })
            if len(pending) >= BATCH_SIZE:
                n += flush_batch(pending, dst)
                pending.clear()
                if n % 20 == 0:
                    print(f"  {n} records")
        n += flush_batch(pending, dst)

    print(f"Wrote {n} predictions to {out_path}")


# Run =====================================================
if __name__ == "__main__":
    model, tokenizer = load_model(
        ADAPTER_PATH or BASE_MODEL, MAX_SEQ_LENGTH, LOAD_IN_4BIT,
    )
    generate_predictions(model, tokenizer, IN_FILE, OUT_FILE, LIMIT)
