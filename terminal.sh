#!/usr/bin/env bash
set -ex

# In WSL the terminal runs on Windows; deploy its config there, not Linux Kitty.
if [[ -n ${WSL_DISTRO_NAME:-} ]] || grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null; then
    exec bash "$(dirname "$0")/wezterm.sh"
fi

if ! [ -x "$(command -v kitty)" ]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  gsettings set org.gnome.desktop.default-applications.terminal exec $HOME/.local/kitty.app/bin/kitty
fi

