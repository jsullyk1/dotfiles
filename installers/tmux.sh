#!/usr/bin/env bash
set -e
source _stow.sh

if [ -x "$(command -v apt)" ]; then
    apt install -y tmux
fi    

if [ -x "$(command -v brew)" ]; then
    brew install tmux
fi

if [ -x "$(command -v pacman)" ]; then
    sudo pacman -S tmux
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
slide_and_stow "tmux" $HOME
