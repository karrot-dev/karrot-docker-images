#!/bin/bash

set -eu

export VERSION="0.1.4"
export VARIANT="backend-beta"
export IMAGE="ghcr.io/karrot-dev/karrot-docker-images:${VERSION}-${VARIANT}"

docker buildx build -t "${IMAGE}" .

if [[ "$*" =~ "--push" ]]; then
  docker push "${IMAGE}"
fi
