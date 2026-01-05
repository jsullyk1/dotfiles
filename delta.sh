#!/usr/bin/env bash

function setup_delta() {
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global delta.line-numbers true
    git config --global delta.side-by-side true
    git config --global syntax-theme one-dark
    git config --global merge.conflictStyle zdiff3
}

if [[ -n "$(command -v delta)" ]]; then
    echo "Delta is already installed."
    exit 0
fi  

if [[ -n "$(command -v apt)" ]]; then
    sudo apt-get install -y git-delta
    setup_delta
fi

if [[ -n "$(command -v brew)" ]]; then
    brew install git-delta
    setup_delta 
fi
