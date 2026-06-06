#!/usr/bin/env bash

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
    clang-21 \
    clangd-21 \
    clang-format-21 \
    clang-tidy-21 \
    binutils \
    binutils-dev \
    python3-venv \
    btop \
    shellfmt \
    shfmt \
    stow

if ! command -v clang &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-21 100
fi
if ! command -v clangd &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-21 100
fi
if ! command -v clang-format &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-21 100
fi
if ! command -v clang-tidy &>/dev/null
then
    sudo update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-21 100
fi
# Install rust if it is not already there.
if ! [ -x "$(command -v cargo)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

sudo snap install zig --beta --classic

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install --lts

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
