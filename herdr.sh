#!/usr/bin/env bash
# Install the herdr TUI (https://herdr.dev/tui/) and stow its config.
set -e

cd "$(dirname "$0")"

# Installs a single binary to ~/.local/bin (override with HERDR_INSTALL_DIR).
curl -fsSL https://herdr.dev/install.sh | sh

# --no-folding: herdr writes logs and session sockets into ~/.config/herdr,
# so only symlink the individual files, never the whole directory.
source _stow.sh
slide_and_stow herdr "$HOME" --no-folding
