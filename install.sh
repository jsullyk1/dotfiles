#! /bin/env bash

cp ./dotfiles/.gitconfig ~

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

cp -R ./dotfiles/.oh-my-zsh ~
cp ./dotfiles/.zshrc ~