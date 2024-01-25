#!/bin/bash

set -eu

export VERSION="13.0.0"
export VARIANT="frontend"
export IMAGE="ghcr.io/karrot-dev/karrot-docker-images:${VERSION}-${VARIANT}"

# --no-cache to ensure we download latest releast
docker buildx build --no-cache -t "${IMAGE}" .

if [[ "$*" =~ "--push" ]]; then
  docker push "${IMAGE}"
fi
