#!/bin/bash

set -a
source .env
set +a

case "$1" in
    clean-image)
        echo "Cleaning up..."
        docker rmi ${IMAGE_NAME}
        ;;
    up)
        echo "Starting container and building..."
        docker compose up --build -d
        ;;
    bash)
        ENTRY_SHELL="/root/entry_shell.sh"
        docker exec -it "$CONTAINER_NAME" "$ENTRY_SHELL"
        ;;
    down)
        echo "Stopping container..."
        docker compose down -v
        ;;
    *)
        echo "Usage: $0 {up|bash|down|clean-image}"
        exit 1
        ;;
esac