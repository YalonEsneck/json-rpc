#!/bin/bash
set -e
export ROOT_DIR="$(realpath "$(dirname "${0}")")"
source "${ROOT_DIR}/docker/facts.sh"

dev=true

dcOptions=
dcFiles=('docker-compose.base.yml')

if [[ ${dev} == 'true' ]]; then
  export DOCKER_IMAGE_FLAVOUR='3'
  export USER_ID=$(id --user)
  export USER_NAME=$(id --user --name)
  export GROUP_ID=$(id --group)
  export GROUP_NAME=$(id --group --name)
  dcFiles+=('docker-compose.dev.yml')
fi

for dcFile in "${dcFiles[@]}"; do
  dcOptions="${dcOptions} --file ${dcFile} "
done

docker-compose \
  $dcOptions \
  up \
    --detach \
    --remove-orphans \
    --build \
  "${@}"
