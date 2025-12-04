#!/usr/bin/env bash

set -ex

sudo snap install yazi --classic

stow --restow yazi -t $HOME
