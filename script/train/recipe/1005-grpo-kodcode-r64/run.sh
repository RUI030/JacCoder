# GRPO on kodcode-1k train_180 from merged v1.3-A: grader self-test → train → dev eval (n=8) of every checkpoint
# (the last one is the final adapter).
# The SFT baseline on dev is the pre-screen run (output/eval/rl/functions/kodcode-1k/v13A-prescreen_dev_*). Log to logs/:
#   setsid nohup bash script/train/recipe/1005-grpo-kodcode-r64/run.sh \
#     > logs/1005-grpo-kodcode-r64.log 2>&1 < /dev/null &
# An interrupted run resumes with `train.py --resume output/adapter/1005-grpo-kodcode-r64/grpo/checkpoint-N`.
set -euo pipefail
cd "$(dirname "$0")/../../../.."
PY=/home/imrui/miniforge3/envs/tornith/bin/python
R=script/train/recipe/1005-grpo-kodcode-r64
OUT=output/adapter/1005-grpo-kodcode-r64
stamp() { echo "===== $(date '+%m-%d %H:%M:%S') $*"; }
stamp "grader self-test"; $PY script/rl/graders/test_functions.py --workers 8
stamp "grpo";             $PY script/train/train.py --recipe $R/grpo.yaml
for C in $(find $OUT/grpo -maxdepth 1 -type d -name 'checkpoint-*' | sort -V); do
  stamp "eval dev $C"
  $PY script/eval/rl/run_eval.py --set kodcode-1k --split dev --adapter $C --n-samples 8 --temperature 0.8 \
      --tag grpo-$(basename $C) --workers 12
done
stamp "ALL_DONE"
