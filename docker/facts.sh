#!/bin/bash

# ----------------------------------------------------------------------------
# Manual facts - adjust as you please

# Word stem of the image name.
DOCKER_IMAGE_NAMESTEM="jsonrpc"

# The registry to push the image to and pull it from.
# Example: "registry.docker.example.com"
DOCKER_REGISTRY=""

# The repository the image resides in. This is basically just a prefix and is
# completely unrelated to git and other tools.
# Example: "ACME" or "project-XYZ"
DOCKER_REPOSITORY="yalonesneck"

# ----------------------------------------------------------------------------
# Automatic facts

# Persistent configuration files that should be tracked by git.
export FILES_CONFIG_DIR="${ROOT_DIR}/files/config"

# Temporary files that must be recreated on the fly if missing.
export FILES_TMP_DIR="${ROOT_DIR}/files/tmp"

# Volumes that are supposed to be mounted into containers (as a local,
# persistent storage).
# Are not supposed to be tracked by git. Whether it is a good idea to delete
# them is up to you.
export FILES_VOLUME_DIR="${ROOT_DIR}/files/volumes"

# Get the git branch's name. Use it as Docker tag later on.
export GIT_BRANCH=$(git -C ${ROOT_DIR} rev-parse --abbrev-ref HEAD)
export DOCKER_TAG=${GIT_BRANCH}

# Git's "master" branch is usually used equivalent to Docker's "latest" tag.
# (That is both stand for the "latest stable".)
if [[ ${GIT_BRANCH} = 'master' ]]; then export DOCKER_TAG='latest'; fi

# Complete image name (including registry -if any- and tag).
export DOCKER_IMAGE="${DOCKER_IMAGE_NAMESTEM}:${DOCKER_TAG}"

# Add repository if defined.
if [[ ! -z ${DOCKER_REPOSITORY} ]]; then export DOCKER_IMAGE="${DOCKER_REPOSITORY}/${DOCKER_IMAGE}"; fi

# Add registry if defined.
if [[ ! -z ${DOCKER_REGISTRY} ]]; then export DOCKER_IMAGE="${DOCKER_REGISTRY}/${DOCKER_IMAGE}"; fi
