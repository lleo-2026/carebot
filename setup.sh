#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

if [ -z "$ORTHANC_PASSWORD" ]; then
  echo "Please set ORTHANC_PASSWORD first. Example:"
  echo "  export ORTHANC_PASSWORD='some-long-password'"
  exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required"
  exit 1
fi

if ! python3 -m venv --help >/dev/null 2>&1; then
  echo "python3 venv support is required"
  echo "On Fedora try: sudo dnf install python3"
  echo "On Ubuntu try: sudo apt install python3-venv"
  exit 1
fi

if [ ! -d .venv ]; then
  python3 -m venv .venv
fi

. .venv/bin/activate

python -m pip install --upgrade pip >/dev/null
python -m pip install "ansible>=9,<11" "docker>=7,<8" >/dev/null

if [ "$(id -u)" != "0" ]; then
  echo "Checking sudo access first..."
  sudo -v
fi

ansible-galaxy collection install community.docker >/dev/null
ansible-playbook playbook.yml "$@"
