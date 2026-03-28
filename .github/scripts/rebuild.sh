#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for gotenberg/gotenberg.dev
# Runs on existing source tree (no clone). Installs deps and builds.

NODE_VERSION="24.11.0"

# --- Node version ---
export NVM_DIR="${HOME}/.nvm"
if [ ! -f "${NVM_DIR}/nvm.sh" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
# shellcheck source=/dev/null
source "${NVM_DIR}/nvm.sh"
nvm install "${NODE_VERSION}"
nvm use "${NODE_VERSION}"
echo "[INFO] Using $(node --version), npm $(npm --version)"

# --- Install dependencies ---
npm ci

# --- Build ---
npm run build

echo "[DONE] Build complete."
