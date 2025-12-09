#! /usr/bin/env bash
set -e
source _stow.sh

sudo apt update
sudo apt install -y zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

slide_and_stow zsh $HOME
slide_and_stow oh-my-zsh $HOME
