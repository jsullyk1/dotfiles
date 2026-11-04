#!/bin/sh
# Herdr side of vim-aware pane navigation (like vim-tmux-navigator).
# Bound to ctrl+h/j/k/l in config.toml. If the focused pane runs vim/nvim/fzf,
# forward the key so the app handles it; otherwise move herdr focus.
# Usage: navigate.sh left|down|up|right
set -eu

dir=$1
pane=${HERDR_ACTIVE_PANE_ID:?not run from a herdr keybinding}
herdr=${HERDR_BIN_PATH:-herdr}

case $dir in
    left)  key=ctrl+h ;;
    down)  key=ctrl+j ;;
    up)    key=ctrl+k ;;
    right) key=ctrl+l ;;
    *) echo "usage: $0 left|down|up|right" >&2; exit 2 ;;
esac

# Same app set as vim-tmux-navigator's is_vim check: vim, nvim, view, vimdiff, fzf.
if "$herdr" pane process-info --pane "$pane" 2>/dev/null |
    grep -Eq '"name":"(g?(view|l?n?vim?x?)(diff)?|fzf)"'; then
    exec "$herdr" pane send-keys "$pane" "$key"
fi
exec "$herdr" pane focus --direction "$dir" --pane "$pane"
