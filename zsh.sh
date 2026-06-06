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

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

slide_and_stow oh-my-zsh $HOME
slide_and_stow zsh $HOME
