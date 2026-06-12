#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

if [ -z "$ORTHANC_PASSWORD" ]; then
  echo "Please set ORTHANC_PASSWORD first. Example:"
  echo "  export ORTHANC_PASSWORD='change-this-password'"
  exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required"
  exit 1
fi

if [ ! -d .venv ]; then
  python3 -m venv .venv
fi

. .venv/bin/activate

python -m pip install --upgrade pip
python -m pip install "ansible>=9,<11" "docker>=7,<8"
ansible-galaxy collection install community.docker

ansible-playbook playbook.yml "$@"
