#!/bin/sh

echo 'DEBUGGING:'
echo "GROUP_ID: ${GROUP_ID}"
echo "USER_ID: ${USER_ID}"
echo "GROUP_NAME: ${GROUP_NAME}"
echo "USER_NAME: ${USER_NAME}"

if [ ! -z "${USER_ID}" ]; then
  USER_GROUP=''

  if [ ! -z "${GROUP_ID}" ]; then
    addgroup --gid ${GROUP_ID} ${GROUP_NAME}
    echo "addgroup --gid ${GROUP_ID} ${GROUP_NAME}"
    USER_GROUP="--gid ${GROUP_ID}"
  fi

  adduser --disabled-password --disabled-login --uid ${USER_ID} ${USER_GROUP} --gecos '' ${USER_NAME}
  echo "adduser --disabled-password --disabled-login --uid ${USER_ID} ${USER_GROUP} --gecos '' ${USER_NAME}"
fi
