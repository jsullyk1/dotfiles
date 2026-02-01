#!/usr/bin/env bash
set -ex
source _stow.sh

if ! [ -x "$(command -v kitty)" ]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

slide_and_stow kitty $HOME

if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  gsettings set org.gnome.desktop.default-applications.terminal exec $HOME/.local/kitty.app/bin/kitty
fi

if [ -x "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install -y zsh
fi

if [ -x "$(command -v brew)" ]; then
    brew install zsh
fi

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

slide_and_stow zsh $HOME


if [ -x "$(command -v apt)" ]; then
    sudo apt update && sudo apt install -y \
        tmux
fi

if [ -x "$(command -v brew)" ]; then
    brew install tmux
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
slide_and_stow "tmux" $HOME
