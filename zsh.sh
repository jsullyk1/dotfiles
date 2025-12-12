#! /usr/bin/env bash
set -e
source _stow.sh

if [ -x "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install -y zsh
fi

if [ -x "$(command -v brew)" ]; then
    brew install zsh
fi

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

slide_and_stow zsh $HOME
