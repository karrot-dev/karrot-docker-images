#!/bin/bash

set -eu

export VERSION="0.1.2"
export VARIANT="frontend"
export IMAGE="ghcr.io/karrot-dev/karrot-docker-images:${VERSION}-${VARIANT}"

docker buildx build -t "${IMAGE}" .

if [[ "$*" =~ "--push" ]]; then
  docker push "${IMAGE}"
fi
