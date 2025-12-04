#!/usr/bin/env bash

set -ex

sudo apt update && sudo apt install gnome-tweaks

dconf load / < gnome.dconf
