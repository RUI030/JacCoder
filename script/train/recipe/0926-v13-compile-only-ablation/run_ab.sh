# v1.3 ablation: cpt -> sft -> Nitin test eval, run A then run B. Log to logs/:
#   setsid nohup bash script/train/recipe/0926-v13-compile-only-ablation/run_ab.sh \
#     > logs/0926-v13-ab-pipeline.log 2>&1 < /dev/null &
# An interrupted stage resumes with `train.py --resume <run>/checkpoint-N`.
set -euo pipefail
cd "$(dirname "$0")/../../../.."
PY=/home/imrui/miniforge3/envs/tornith/bin/python
R=script/train/recipe/0926-v13-compile-only-ablation
stamp() { echo "===== $(date '+%m-%d %H:%M:%S') $*"; }
wait_grading() {  # never run two grade_stream's at once: they share jac's embedded postgres
  while ps -eo args | grep -q "[g]raders/grade_stream.py"; do sleep 60; done
}
for V in A B; do
  stamp "cpt-$V";  $PY script/train/train.py --recipe $R/cpt-$V.yaml
  stamp "sft-$V";  $PY script/train/train.py --recipe $R/sft-$V.yaml
  wait_grading
  stamp "eval-$V"; $PY script/eval/Nitin-test/run_eval.py \
      --adapter output/adapter/0926-v13-$V/sft/adapter --split test --tag v13$V --workers 6
done
stamp "ALL_DONE"
