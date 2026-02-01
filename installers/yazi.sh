#!/usr/bin/env bash
set -ex
source _stow.sh

sudo snap install yazi --classic
slide_and_stow yazi $HOME
