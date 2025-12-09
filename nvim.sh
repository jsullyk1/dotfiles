#!/usr/bin/env bash

set -e
source _stow.sh

if [ -x "$(command -v snap)" ]; then
    sudo snap install nvim --classic
elif [ -x "$(command -v brew)" ]; then
    brew install nvim
else
    echo "Couldn't find an install method."
fi

slide_and_stow "nvim" $HOME


