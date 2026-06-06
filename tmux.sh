#!/usr/bin/env bash
set -e

if [ -x "$(command -v apt)" ]; then
    sudo apt install -y tmux
fi    

if [ -x "$(command -v brew)" ]; then
    sudo brew install tmux
fi

if [ -x "$(command -v pacman)" ]; then
    sudo pacman -S tmux
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
