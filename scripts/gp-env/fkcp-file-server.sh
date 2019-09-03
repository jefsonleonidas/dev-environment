#!/bin/bash

export CONTAINER_FILESERVER=fkcp-file-server
export FILESERVER_SCP_USER=fkcp
export FILESERVER_SCP_PASS=Cryk7OnPalv
export PRODUCT_VENDOR="furukawalatam"
export PRODUCT_NAME="profilemanager"
export VOLUME_ROOT="/var/lib/${PRODUCT_VENDOR}/${PRODUCT_NAME}"
export VOLUME_FILESERVER="${VOLUME_ROOT}/${CONTAINER_FILESERVER}/data"
export VERSION="2.0.0-SNAPSHOT"

    echo "* Starting filed server..."
    docker run --name ${CONTAINER_FILESERVER} \
        --hostname ${CONTAINER_FILESERVER} \
        --network=host \
        --volume "${VOLUME_FILESERVER}:/data" \
        --env FILE_SERVER_SCP_USER="${FILESERVER_SCP_USER}" \
        --env FILE_SERVER_SCP_PASS="${FILESERVER_SCP_PASS}" \
        -p 8022:8022 \
        -p 69:69/udp \
        -d furukawalatam/${CONTAINER_FILESERVER}:${VERSION} 1>/dev/null
