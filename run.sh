#!/bin/bash

DOCKER_IMAGE='alpine/terragrunt:latest'
SUDO=

SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$TERM" != "dumb" ] ; then
    TTY='-it'
fi

if [ "$( uname -s )" != 'Darwin' ]; then
    if [ ! -w "${DOCKER_SOCKET}" ]; then
       SUDO='sudo'
    fi
fi

# If we already have a gcloud config, try to mount it in
GCLOUD_MOUNT=
if [ -d "${HOME}/.config/gcloud" ]; then
    GCLOUD_MOUNT="-v ${HOME}/.config/gcloud:/root/.config/gcloud"
fi

$SUDO docker pull "$DOCKER_IMAGE" \

$SUDO docker run $TTY \
    --rm \
    $GCLOUD_MOUNT -v $SCRIPT_DIR:/apps \
    $DOCKER_IMAGE "$@"
