FROM debian:bookworm

# Install build tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \   
    build-essential gcc g++ \
    clang llvm make cmake git bison flex \
    cpio python3 wget curl xz-utils bc pkg-config \ 
    gcc-multilib python3-pip python3-setuptools \
    python3-jsonschema vim nano && \
    rm -rf /var/lib/apt/lists/*

# Install libraries
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libc6-i386 libc6-dev-i386 \
    libcap-ng-dev libcap-dev liburing-dev \
    libelf-dev libfuse-dev  \
    libnl-3-dev libnl-genl-3-dev libpopt-dev libmnl-dev \
    libnuma-dev libmbedtls-dev libasound2-dev \
    libncurses-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/* 