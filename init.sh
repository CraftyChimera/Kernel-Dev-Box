#!/bin/bash

LOG_FILE="/root/init.log"
KERNEL_DIR="/root/linux"
BUILD_LOCK="/root/build.lock"
touch "$BUILD_LOCK"

rm "$LOG_FILE"
cd "$KERNEL_DIR"

# If .config doesn't exist, run olddefconfig and create it
if [ ! -f ".config" ]; then
    echo -e "No .config found. Running olddefconfig" >> "$LOG_FILE"
    make olddefconfig
fi

# Compile headers
echo -e "Building headers" >> "$LOG_FILE"
make headers

# Compile the kernel
echo -e "Building the kernel" >> "$LOG_FILE"
make -j $(nproc) 

# Prepare modules
echo -e "Preparing modules" >> "$LOG_FILE"
make modules_prepare

# Build the modules
echo -e "Building the modules" >> "$LOG_FILE"
make modules

# Build complete — remove lock to allow interactive access
rm -f "$BUILD_LOCK"
echo -e "Build complete; Moving to bash" >> "$LOG_FILE"
exec bash