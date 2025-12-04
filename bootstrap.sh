#!/bin/bash

set -e
set -x

sudo apt update && sudo apt-get install -y \
    git \
    curl \
    wget \
    stow
