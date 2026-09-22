#!/usr/bin/env bash
# Append GPU / VRAM / CPU / RAM usage to a CSV every INTERVAL seconds.
#
#   bash script/monitor.sh [OUT_CSV] [INTERVAL]
#   setsid nohup bash script/monitor.sh logs/usage.csv 30 >/dev/null 2>&1 &
#
# train_rss_gb is the summed RSS of all train.py processes (incl. dataloader workers).
set -euo pipefail

OUT="${1:-logs/usage.csv}"
INTERVAL="${2:-30}"

cpu_sample() { awk '/^cpu /{idle=$5+$6; total=0; for(i=2;i<=NF;i++) total+=$i; print idle, total}' /proc/stat; }

[[ -s "${OUT}" ]] || echo "time,gpu_util_pct,vram_used_gb,vram_total_gb,gpu_power_w,gpu_temp_c,cpu_util_pct,ram_used_gb,ram_total_gb,train_rss_gb" > "${OUT}"

read -r idle0 total0 < <(cpu_sample)
while true; do
    sleep "${INTERVAL}"
    read -r idle1 total1 < <(cpu_sample)
    cpu=$(awk -v di=$((idle1 - idle0)) -v dt=$((total1 - total0)) 'BEGIN{printf "%.1f", dt ? 100 * (1 - di / dt) : 0}')
    idle0=${idle1}; total0=${total1}

    gpu=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,power.draw,temperature.gpu \
                     --format=csv,noheader,nounits | head -1 |
          awk -F', *' '{printf "%s,%.1f,%.1f,%.0f,%s", $1, $2/1024, $3/1024, $4, $5}')
    ram=$(free -b | awk '/^Mem:/{printf "%.1f,%.1f", ($2-$7)/2^30, $2/2^30}')
    rss=$(ps -eo rss=,args= | awk '/train\.py/ && !/awk/{s+=$1} END{printf "%.1f", s/2^20}')

    echo "$(date +%F\ %T),${gpu},${cpu},${ram},${rss}" >> "${OUT}"
done
