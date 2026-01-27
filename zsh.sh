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

if [ -x "$(command -v pacman)" ]; then
    sudo pacman -S zsh
fi

# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

slide_and_stow oh-my-zsh $HOME
slide_and_stow zsh $HOME
