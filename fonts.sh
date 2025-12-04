#!/usr/bin/env bash

set -ex

stow --restow fonts -t $HOME
fc-cache -f
