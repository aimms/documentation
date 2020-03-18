#!/usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
CI_COMMIT_REF_NAME="${CI_COMMIT_REF_NAME:-$(git rev-parse --abbrev-ref HEAD)}"

export PATH="$HOME/.local/bin:$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

function cleanup {
	local EXIT_CODE=$?

	# Disable trap to avoid duplicate handling
	trap - EXIT INT TERM

	exit $EXIT_CODE
}

trap cleanup EXIT INT TERM

# TODO: Move installing python packages into the docker image

rm -rf /tmp/workdir
cp -r "$DIR" /tmp/workdir
cd /tmp/workdir

echo -e "\e[36m"
pipenv run python --version
pipenv run pip --version
pipenv run sphinx-build --version
echo -e "\e[0m"

pipenv run sphinx-build -M html . _build

if [[ "$CI_COMMIT_REF_NAME" == "master" ]]; then
  rsync -rt _build/html/ support@data.aimms.com:/home/aimms/www/documentation.aimms.com
fi
