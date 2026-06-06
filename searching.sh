#!/usr/bin/env bash
set -e

sudo apt update && sudo apt install -y \
    ripgrep \
    bat \
    fd-find

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

install -d $HOME/.local/bin

if ! command -v fd &>/dev/null
then
        ln -s $(which fdfind) $HOME/.local/bin/fd
fi
