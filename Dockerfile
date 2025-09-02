FROM debian:bookworm

# Basic requirements
RUN apt-get update
RUN apt-get install -y build-essential gcc g++ clang llvm make cmake git bison flex 
RUN apt-get install -y cpio python3 wget curl xz-utils bc pkg-config

# For 32 bit support
RUN apt-get install -y gcc-multilib libc6-i386 libc6-dev-i386

# Python libraries
RUN apt-get install -y python3-pip python3-setuptools python3-jsonschema

# Necessary libraries for selftests
RUN apt-get install -y libcap-ng-dev libcap-dev liburing-dev libelf-dev libfuse-dev  
RUN apt-get install -y libnl-3-dev libnl-genl-3-dev libpopt-dev libmnl-dev libnuma-dev
RUN apt-get install -y libmbedtls-dev libasound2-dev libncurses-dev libssl-dev 

# User utilities
RUN apt-get install -y vim nano

RUN rm -rf /var/lib/apt/lists/*

