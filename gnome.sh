#!/usr/bin/env bash

set -ex

sudo apt update && sudo apt install -y gnome-tweaks

dconf load / < gnome.dconf
