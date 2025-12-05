#!/usr/bin/env bash

set -ex
source _stow.sh
slide_and_stow fonts $HOME
fc-cache -f
