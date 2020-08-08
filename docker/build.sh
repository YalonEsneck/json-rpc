#!/bin/bash
set -e
ROOT_DIR="$(realpath "$(dirname "${0}")")"
source "${ROOT_DIR}/facts.sh"

docker build "${ROOT_DIR}" \
  --pull \
  --tag="${DOCKER_IMAGE}" \
  "${@}"
