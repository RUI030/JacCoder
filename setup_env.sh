#!/usr/bin/env bash
set -euo pipefail

ENV_NAME="${1:-jacllm}"
PYTHON_VERSION="${PYTHON_VERSION:-3.12}"
TORCH_BACKEND="${TORCH_BACKEND:-auto}"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REQUIREMENTS_FILE="${SCRIPT_DIR}/requirement.txt"

if command -v mamba >/dev/null 2>&1; then
    MAMBA_BIN="$(command -v mamba)"
elif [[ -x "${HOME}/miniforge3/bin/mamba" ]]; then
    MAMBA_BIN="${HOME}/miniforge3/bin/mamba"
else
    echo "Error: mamba was not found." >&2
    exit 1
fi

# mamba 1.x prints the bare path; mamba 2.x prints "base environment : <path>".
MAMBA_BASE="$("${MAMBA_BIN}" info --base | awk -F': ' '{print $NF}' | tr -d '[:space:]')"
ENV_PREFIX="${MAMBA_BASE}/envs/${ENV_NAME}"

if [[ -d "${ENV_PREFIX}/conda-meta" ]]; then
    echo "Updating existing environment '${ENV_NAME}' with Python ${PYTHON_VERSION}..."
    "${MAMBA_BIN}" install --name "${ENV_NAME}" --yes \
        "python=${PYTHON_VERSION}" pip
else
    echo "Creating environment '${ENV_NAME}' with Python ${PYTHON_VERSION}..."
    "${MAMBA_BIN}" create --name "${ENV_NAME}" --yes \
        "python=${PYTHON_VERSION}" pip
fi

ENV_PYTHON="${ENV_PREFIX}/bin/python"
"${ENV_PYTHON}" -m pip install --upgrade pip uv

# --torch-backend=auto is a uv option, not pip's --no-deps. It chooses mutually
# compatible Torch, torchvision, Triton, and xFormers builds for the detected
# NVIDIA/AMD/CPU platform; requirement.txt owns the portable package pins.
# Override with TORCH_BACKEND=cu130 (etc.) when auto picks an index with no
# build inside unsloth's torch cap: on CUDA 13.2 drivers auto selects cu132,
# which only has torch>=2.12, and uv silently falls back to a +cpu wheel.
"${ENV_PREFIX}/bin/uv" pip install \
    --python "${ENV_PYTHON}" \
    --torch-backend="${TORCH_BACKEND}" \
    --upgrade \
    --requirements "${REQUIREMENTS_FILE}"

"${ENV_PYTHON}" -m pip check
"${ENV_PYTHON}" -m ipykernel install --user \
    --name "${ENV_NAME}" \
    --display-name "Python (${ENV_NAME})"

"${ENV_PYTHON}" - <<'PY'
import unsloth
import torch
import transformers
import trl
import unsloth_zoo

print(f"Python executable: {__import__('sys').executable}")
print(f"Torch:            {torch.__version__}")
print(f"Transformers:     {transformers.__version__}")
print(f"TRL:              {trl.__version__}")
print(f"Unsloth:          {unsloth.__version__}")
print(f"Unsloth Zoo:      {unsloth_zoo.__version__}")
print(f"CUDA available:   {torch.cuda.is_available()}")
PY

echo
echo "Environment ready. Activate it with:"
echo "  mamba activate ${ENV_NAME}"
echo "VS Code interpreter:"
echo "  ${ENV_PYTHON}"
