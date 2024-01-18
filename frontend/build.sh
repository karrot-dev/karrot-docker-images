#!/bin/bash

set -eu

export VERSION="0.1.4"
export VARIANT="frontend-beta"
export IMAGE="ghcr.io/karrot-dev/karrot-docker-images:${VERSION}-${VARIANT}"

docker buildx build --no-cache -t "${IMAGE}" .

if [[ "$*" =~ "--push" ]]; then
  docker push "${IMAGE}"
fi
