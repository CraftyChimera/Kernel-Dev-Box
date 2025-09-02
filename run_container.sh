#!/bin/bash

set -a
source .env
set +a

case "$1" in
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
        echo "Usage: $0 {up|bash|down}"
        exit 1
        ;;
esac