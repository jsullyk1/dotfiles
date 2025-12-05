#!/usr/bin/env bash

set -ex
source _stow.sh

sudo snap install nvim --classic
slide_and_stow "nvim" $HOME


