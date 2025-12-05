#!/usr/bin/env bash

set -ex

sudo apt update && sudo apt install -y \
    gnome-tweaks \
    gnome-shell-extensions \
    gnome-shell-extension-manager

wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

# Tactile 4548
# switcher 973
# space-bar 5090
# just perfection 3843
gnome-shell-extension-installer --yes 973 5090 4548 3843 

dconf load / < gnome.dconf
