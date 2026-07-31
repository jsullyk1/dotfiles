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
    clang-22 \
    clangd-22 \
    clang-format-22 \
    clang-tidy-22 \
    llvm-22 \
    lld-22 \
    binutils \
    binutils-dev \
    python3-venv \
    ninja-build \
    btop \
    shfmt \
    stow

sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-22 1
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-22 1
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-22 1
sudo update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-22 1
sudo update-alternatives --install /usr/bin/lld lld /usr/bin/lld-22 1
sudo update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-22 1

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

# nvim-treesitter (main branch) builds every parser with `tree-sitter build`, so
# the CLI is required. Distro packages lag badly (Ubuntu ships 0.20), and the
# npm package is explicitly unsupported, so take the upstream release binary.
if ! [ -x "$(command -v tree-sitter)" ]; then
    mkdir -p "$HOME/.local/bin"
    curl -sSL -o /tmp/tree-sitter.gz \
        https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz
    gunzip -f /tmp/tree-sitter.gz
    chmod +x /tmp/tree-sitter
    mv /tmp/tree-sitter "$HOME/.local/bin/tree-sitter"
fi
