#! /usr/bin/env bash
sudo apt update
sudo apt install -y zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

stow --dotfiles -t $HOME zsh
stow --dotfiles -t $HOME oh-my-zsh
