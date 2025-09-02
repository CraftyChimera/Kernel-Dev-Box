#!/bin/bash

BUILD_LOCK="/root/build.lock"
LOG_FILE="/root/init.log"

# Check if build is in progress
if [ -f "$BUILD_LOCK" ]; then
    echo "Kernel build in progress. Log in later."
    echo -e "Current Status:\n"
    cat "$LOG_FILE"
    exit 1
fi

echo "Welcome"
exec bash