#!/usr/bin/env bash

set -e
source _stow.sh

sudo apt update && sudo apt install -y \
    tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

slide_and_stow "tmux" $HOME
