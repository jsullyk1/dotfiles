#!/usr/bin/env bash
set -e

sudo apt update && sudo apt install -y \
    fzf \
    ripgrep \
    bat \
    fd-find

install -d $HOME/.local/bin
ln -s $(which fdfind) $HOME/.local/bin/fd
