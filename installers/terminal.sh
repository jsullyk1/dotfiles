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

