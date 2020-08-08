ARG DOCKER_IMAGE_FLAVOUR=3-alpine
ARG PROJECT_PATH=/usr/src/jsonrpc

# -----------------------------------------------------------------------------

FROM python:3 AS builder

ARG PROJECT_PATH

RUN mkdir -p ${PROJECT_PATH} \
 && python -m venv ${PROJECT_PATH}/venv

# -----------------------------------------------------------------------------

FROM python:${DOCKER_IMAGE_FLAVOUR}

ARG PROJECT_PATH

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME=dev
ARG GROUP_NAME=dev

ARG ADD_USER_SCRIPT_PATH=/usr/local/bin/devUser.sh
COPY files/scripts/devUser.sh ${ADD_USER_SCRIPT_PATH}
RUN chmod a=rx ${ADD_USER_SCRIPT_PATH} \
 && ${ADD_USER_SCRIPT_PATH} \
 && rm ${ADD_USER_SCRIPT_PATH}

COPY --from=builder /usr/src/jsonrpc /usr/src/jsonrpc
WORKDIR /usr/src/jsonrpc

EXPOSE 80
