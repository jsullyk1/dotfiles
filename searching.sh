#!/usr/bin/env bash
set -ex

sudo apt update && sudo apt install -y \
    fzf \
    ripgrep \
    bat
