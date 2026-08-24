import json, sys
from pathlib import Path
from datetime import datetime

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from utils.model import load_model, generate

# Setting =================================================
TASK_TYPE     = "code_completion"
DS_NAME       = "Nitin-10k-jac-functions"
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

LIMIT = 5  # 0 => all records

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent
IN_FILE  = f"{PROJECT_ROOT}/dataset/sft/{TASK_TYPE}/{DS_NAME}/{SPLIT}.jsonl"
TAG      = Path(ADAPTER_PATH).name if ADAPTER_PATH else BASE_MODEL.replace("/", "_")
STAMP    = datetime.now().strftime("%m-%d_%H-%M")
OUT_DIR  = f"{PROJECT_ROOT}/output/eval/{TASK_TYPE}/{DS_NAME}/{TAG}_{STAMP}"
OUT_FILE = f"{OUT_DIR}/predictions.jsonl"


# Functions ===============================================
def run_inference(in_file=IN_FILE, out_file=OUT_FILE, limit=LIMIT):
    """Read SFT records, generate assistant replies, write predictions.jsonl."""
    in_path  = Path(in_file)
    out_path = Path(out_file)
    if not in_path.is_file():
        raise FileNotFoundError(f"Input split not found: {in_path}")
    out_path.parent.mkdir(parents=True, exist_ok=True)

    model, tokenizer = load_model(
        ADAPTER_PATH or BASE_MODEL, MAX_SEQ_LENGTH, LOAD_IN_4BIT,
    )

    n = 0
    with in_path.open("r", encoding="utf-8") as src, \
         out_path.open("w", encoding="utf-8") as dst:
        for idx, line in enumerate(src):
            if limit and n >= limit:
                break
            rec = json.loads(line)
            messages = [m for m in rec["messages"] if m["role"] != "assistant"]
            reply = generate(
                model, tokenizer, messages,
                max_new_tokens=MAX_NEW_TOKENS,
                temperature=TEMPERATURE,
                top_p=TOP_P,
                repetition_penalty=REPETITION_PENALTY,
                enable_thinking=ENABLE_THINKING,
            )
            out = {
                "id": idx,
                "prediction": reply,
                "reference": next(
                    (m["content"] for m in rec["messages"] if m["role"] == "assistant"),
                    "",
                ),
                "meta": rec.get("meta", {}),
            }
            json.dump(out, dst, ensure_ascii=False)
            dst.write("\n")
            dst.flush()
            n += 1
            if n % 20 == 0:
                print(f"  {n} records")

    print(f"Wrote {n} predictions to {out_path}")


# Run =====================================================
if __name__ == "__main__":
    run_inference()
