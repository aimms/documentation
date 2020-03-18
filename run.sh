#!/usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
CI_COMMIT_REF_NAME="${CI_COMMIT_REF_NAME:-$(git rev-parse --abbrev-ref HEAD)}"
CI_PIPELINE_ID="${CI_PIPELINE_ID:-$RANDOM}"
CI_JOB_ID="${CI_JOB_ID:-$RANDOM}"
CI_JOB_NAME="${CI_JOB_ID:-"documentation"}"
CONTAINER_NAME="${CI_JOB_NAME//[ \/]/_}_${CI_PIPELINE_ID}_${CI_JOB_ID}"
DOCKER_IMAGE_REPO="205071799231.dkr.ecr.eu-west-1.amazonaws.com"
DOCKER_IMAGE_NAME="documentation"
DOCKERFILE_HASH="$(sha1sum "$DIR"/Dockerfile | cut -c 1-10)"
PIPFILE_HASH="$(sha1sum "$DIR"/Pipfile | cut -c 1-10)"
PIPFILE_LOCK_HASH="$(sha1sum "$DIR"/Pipfile.lock | cut -c 1-10)"
DOCKER_IMAGE_VERSION="$DOCKERFILE_HASH-$PIPFILE_HASH-$PIPFILE_LOCK_HASH"

export DOCKER_IMAGE="$DOCKER_IMAGE_REPO/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION"

"$DIR/build-docker.sh"

function cleanup {
	local EXIT_CODE=$?

	# Disable trap to avoid duplicate handling
	trap - EXIT INT TERM

	if docker inspect "$CONTAINER_NAME" > /dev/null 2>&1; then
		docker rm --volumes --force "$CONTAINER_NAME"
	fi

	exit $EXIT_CODE
}

trap cleanup EXIT INT TERM

docker run \
	--name "$CONTAINER_NAME" \
  --env CI_COMMIT_REF_NAME="$CI_COMMIT_REF_NAME" \
	--volume "$DIR:$DIR:ro" \
  "$DOCKER_IMAGE" \
	/usr/bin/timeout 15m "$DIR"/build.sh
