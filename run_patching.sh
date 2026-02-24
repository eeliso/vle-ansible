#!/bin/bash
# =============================================================================
# Local Patching Automation Script for dev-ws2
# =============================================================================
# This script is designed to be run from a crontab.
# It sets up the environment and runs the Ansible patching playbook.

# --- Configuration ---
PROJECT_DIR="/home/ei/Dev/vle-ansible"
LOG_FILE="${PROJECT_DIR}/patching.log"

# Set your ANSIBLE_PASSWORD here if not set in your shell profile
# export ANSIBLE_PASSWORD="your_secure_password"

# --- Environment Setup (pyenv) ---
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# --- Execution ---
cd "${PROJECT_DIR}" || exit 1

echo "--- [$(date)] Starting Monthly Patching ---" >> "${LOG_FILE}"

# Run the playbook
ansible-playbook patch.yml >> "${LOG_FILE}" 2>&1

echo "--- [$(date)] Patching Completed ---" >> "${LOG_FILE}"
