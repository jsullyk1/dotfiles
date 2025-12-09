#!/usr/bin/env bash

set -ex
source _stow.sh

if [ -x "$(command -v fc-cache)" ]; then
    slide_and_stow fonts $HOME
    fc-cache -f
elif [ -d "$HOME/Library/Fonts" ]; then
    cp -R fonts/.local/share/fonts/*.* $HOME/Library/Fonts/
fi
