#!/usr/bin/env bash

set -e
source _stow.sh

if [[ ! -d "$HOME/.local/kitty.app" ]]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

slide_and_stow "kitty" $HOME
gsettings set org.gnome.desktop.default-applications.terminal exec $HOME/.local/kitty.app/bin/kitty

sudo apt update && sudo apt install -y \
    tmux

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
slide_and_stow "tmux" $HOME
