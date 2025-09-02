# Kernel Dev Box

A containerized, reproducible environment for building Linux kernel artifacts for development and testing.

## Config

If your kernel directory does not contain a .config file, the container will use Debian’s default kernel configuration.

You can edit the .env file to set environment variables and customize paths or options.

The current ENV variables are:

```bash
# Path of Linux dir to be compiled
COMPILE_PATH=
# Container name
APP_NAME=
```

## Build Instructions

The main interface is run_container.sh. Use it to manage the container and interact with the kernel build environment:

```bash
# Build and start the container in the background
./run_container.sh start

# Log into the container with an interactive shell
# This will exit if the kernel build is still in progress
./run_container.sh bash

# Stop the container
./run_container.sh down
```

    