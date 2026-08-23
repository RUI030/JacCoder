import os, json
from pathlib import Path
from datasets import load_dataset

# Setting =================================================
FORMAT  = "function" # or "markdown", "repo", "diff", "session"
DS_NAME = "Nitin-10k-jac-functions"

DS_ROOT = f"{Path(__file__).resolve().parent}../../dataset"
IN_DIR  = f"{DS_ROOT}/raw/{FORMAT}/{DS_NAME}"
OUT_DIR = f"{DS_ROOT}/CPT/{DS_NAME}"

PROMPT  = f"{DS_ROOT}/raw/prompt_template.json"
FORMAT  = "jsonl" # or "parquet"

# Functions ===============================================
def json2parquet(in_dir=IN_DIR, out_dir=OUT_DIR):
    ds = load_dataset("json", data_files=in_dir, split="train")
    ds.to_parquet(out_dir)

# <TODO>:
# Do we need this? or we just json dump?
def load_jac(fp)->str:
    # deal with special character that might break things like ", ', `, \n...
    return "converted strings here"

def jac2cpt(in_dir = IN_DIR, out_dir = OUT_DIR, format = FORMAT):
    """
    add a commet to tell the model this is jac
    json format first
    user decide if convert in parquet with `format` var
    """
    # Recursively read the .jac file in in_dir

    # Randomly add prefix commemnt
    with open(PROMPT, "r", encoding="utf-8") as f:
        prompt = json.load(f)

    # Formatting to {"text":"<prefix>\n<converted jac string>"}

    
        

