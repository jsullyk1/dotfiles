#!/usr/bin/env bash

wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | sudo tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc
echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble main" | sudo tee /etc/apt/sources.list.d/llvm.list
echo "deb-src http://apt.llvm.org/noble/ llvm-toolchain-noble main" | sudo tee -a /etc/apt/sources.list.d/llvm.list

sudo apt update && sudo apt install -y \
    make \
    cmake \
    git \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    pkg-config \
    build-essential \
    clang-20 \
    clangd-20 \
    clang-format-20 \
    clang-tidy-20 \
    binutils \
    binutils-dev \
    python3-venv

if ! command -v clang &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clangd clang /usr/bin/clang-20 100
fi
if ! command -v clangd &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-20 100
fi
if ! command -v clang &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clang-format clangd /usr/bin/clang-format-20 100
fi
if ! command -v clang &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clangd clang-tidy /usr/bin/clang-tidy-20 100
fi
# Install rust if it is not already there.
if ! [ -x "$(command -v cargo)" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

