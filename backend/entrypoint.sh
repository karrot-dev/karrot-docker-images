#!/bin/bash

set -eu

if [[ -z "${IS_WORKER:-}" ]]; then
  echo "Running app server"

  # try and update geo ip date, but ok if it fails
  echo 'Updating geoip data, first time could be slow...'
  geoipupdate || true

  python karrot-backend.pyz migrate
  python karrot-backend.pyz server

else
  echo "Running worker"
  python karrot-backend.pyz worker
fi
