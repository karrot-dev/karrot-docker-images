#!/bin/bash

set -eu

if [[ -z "${IS_WORKER:-}" ]]; then
  echo "Running app server"

  if [[ ! -z "${MAXMIND_ACCOUNT_ID:-}" ]]; then
    echo 'Updating GeoIP data, first time could be slow...'
    geoipupdate
  else
    echo 'GeoIP is not configured'
  fi

  python karrot-backend.pyz migrate
  python karrot-backend.pyz server

else
  echo "Running worker"
  python karrot-backend.pyz worker
fi
