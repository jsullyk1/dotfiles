#!/usr/bin/env bash

set -ex

sudo apt update && sudo apt install -y \
    gnome-tweaks \
    gnome-shell-extensions \
    gnome-shell-extension-manager

if ! command -v gnome-shell-extension-installer &> /dev/null
then
    wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
    chmod +x gnome-shell-extension-installer
    sudo mv gnome-shell-extension-installer /usr/bin/
fi
# Tactile 4548
# switcher 973
# just perfection 3843

dconf load / < gnome.dconf
