#!/usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# shellcheck disable=SC2092
# shellcheck disable=SC2006
`aws ecr get-login --no-include-email --region eu-west-1 --profile deploydevnew`

PYTHON_VERSION="$(cat "$DIR"/.python-version)"

if ! docker pull "$DOCKER_IMAGE" > /dev/null 2>&1; then
	docker build \
		--tag "$DOCKER_IMAGE" \
		--file "${DIR}/Dockerfile" \
    --build-arg PYTHON_VERSION="$PYTHON_VERSION" \
		"$DIR"
	docker push "$DOCKER_IMAGE"
fi
