#!/usr/bin/env bash
# Deploy WezTerm config to the machine running the terminal.
set -euo pipefail
cd "$(dirname "$0")"

if [[ -n ${WSL_DISTRO_NAME:-} ]] || grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null; then
    if ! command -v cmd.exe >/dev/null || ! command -v wslpath >/dev/null; then
        echo "WSL Windows interop is required to find the Windows profile." >&2
        exit 1
    fi

    # Ask Windows rather than assuming its username matches the Linux username.
    # Use a Windows working directory to avoid cmd.exe's WSL UNC-path warning.
    windows_profile=$(cd "$(dirname "$(command -v cmd.exe)")" && cmd.exe /d /c 'echo %USERPROFILE%' | tr -d '\r\n')
    if [[ ! $windows_profile =~ ^[A-Za-z]:\\ ]]; then
        echo "Could not determine the Windows user profile: $windows_profile" >&2
        exit 1
    fi
    profile=$(wslpath -u "$windows_profile")
    if [[ ! -d $profile ]]; then
        echo "Windows profile is not accessible: $profile" >&2
        exit 1
    fi
    target="$profile/.wezterm.lua"
    source_config=wezterm/.wezterm.lua

    # Copy: Windows WezTerm cannot reliably follow a WSL filesystem symlink.
    if cmp -s "$source_config" "$target"; then
        echo "WezTerm config is already up to date: $target"
    else
        if [[ -e $target || -L $target ]]; then
            backup="${target}.bak.$(date +%Y%m%d-%H%M%S).$$"
            cp -p "$target" "$backup"
            echo "Backed up WezTerm config: $backup"
        fi
        cp "$source_config" "$target"
        echo "Installed WezTerm config: $target"
    fi
    echo "Run this installer again after changing the repo config."
    echo "WezTerm and JetBrainsMono Nerd Font Mono must be installed on Windows."
else
    source _stow.sh
    slide_and_stow wezterm "$HOME"
fi
