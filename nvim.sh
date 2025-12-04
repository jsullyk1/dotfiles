#!/usr/bin/env bash

set -ex

sudo snap install nvim --classic

stow --restow nvim -t $HOME

