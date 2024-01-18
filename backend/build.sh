#!/bin/bash

set -eu

export VERSION="0.1.6"
export VARIANT="backend-beta"
export IMAGE="ghcr.io/karrot-dev/karrot-docker-images:${VERSION}-${VARIANT}"

# --no-cache to ensure we download latest releast
docker buildx build --no-cache -t "${IMAGE}" .

if [[ "$*" =~ "--push" ]]; then
  docker push "${IMAGE}"
fi
