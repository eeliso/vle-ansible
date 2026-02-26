#!/bin/bash
# =============================================================================
# Local SCC Scan Automation Script for dev-ws2
# =============================================================================
# This script sets up the pyenv environment where Ansible is installed
# and runs the SCC scan playbook.

# --- Configuration ---
PROJECT_DIR="/home/user/vle-ansible"
LOG_FILE="${PROJECT_DIR}/scc.log"

# Set your ANSIBLE_PASSWORD here if not set in your shell profile
export ANSIBLE_PASSWORD=""

# --- Environment Setup (pyenv) ---
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# --- Execution ---
cd "${PROJECT_DIR}" || exit 1

echo "--- [$(date)] Starting SCC Scan ---" >> "${LOG_FILE}"

# Run the playbook
ansible-playbook scc.yml >> "${LOG_FILE}" 2>&1

echo "--- [$(date)] SCC Scan Completed ---" >> "${LOG_FILE}"
