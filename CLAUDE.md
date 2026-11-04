# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository managed with **GNU Stow**. Configurations are organized into packages (subdirectories), each mirroring the target directory structure (typically `$HOME`). Stow creates symlinks from the package files into the target.

## Deploying Configurations

**Bootstrap first** (installs git, curl, wget, stow):
```sh
./bootstrap.sh
```

**Stow a single package** (e.g., just nvim or zsh):
```sh
stow nvim -t $HOME
stow zsh -t $HOME
```

**Safe stow with backup** (backs up conflicting files to `~/dotfiles.bak/` before symlinking):
```sh
source _stow.sh
slide_and_stow nvim $HOME
```

**Install everything for a terminal setup**:
```sh
./terminal.sh   # kitty + zsh + tmux
./nvim.sh       # neovim + stow nvim config
./tools.sh      # LLVM, Rust, Node/NVM, Zig, tree-sitter CLI, etc.
./herdr.sh      # herdr TUI (agent multiplexer) + stow herdr config
```

## Package Structure

Each top-level directory is a stow package:
- `nvim/` → `~/.config/nvim/`
- `zsh/` → `~/.zshrc`, `~/.zshenv`
- `oh-my-zsh/` → `~/.oh-my-zsh/custom/`
- `tmux/` → `~/.tmux.conf`, `~/.config/tmux-powerline/`
- `kitty/` → `~/.config/kitty/`
- `yazi/` → `~/.config/yazi/`
- `fonts/` → `~/.local/share/fonts/`
- `herdr/` → `~/.config/herdr/` (stow with `--no-folding`: herdr keeps logs/sockets in that dir)

## Neovim Architecture

Config lives at `nvim/.config/nvim/` with this layout:

```
init.lua              — bootstraps lazy.nvim, loads vim-options, then all plugins/
lua/
  vim-options.lua     — all vim settings, keymaps, autocommands, floating terminal
  plugins/            — one file per plugin or logical group
```

**Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-installed on first launch). `lazy-lock.json` is intentionally gitignored.

**Treesitter**: pinned to nvim-treesitter's `main` branch — `master` is locked to Nvim 0.11 and breaks highlighting on 0.12. `main` requires the `tree-sitter` CLI (>=0.26.1, installed by `tools.sh`) plus a C compiler, since it builds every parser locally. It has no `highlight`/`auto_install` options, so `treesitter.lua` starts highlighting from a `FileType` autocommand and installs missing parsers on demand. Parsers live in `~/.local/share/nvim/site/parser/`.

**Plugin files** (`lua/plugins/`):
| File | Purpose |
|------|---------|
| `theme.lua` | OneDark colorscheme with transparent background |
| `lsp.lua` | nvim-lspconfig + Mason for LSP servers |
| `autocomplete.lua` | blink.cmp completion |
| `treesitter.lua` | Syntax highlighting and folding |
| `telescope.lua` | Fuzzy finding (files, buffers, LSP) |
| `oil.lua` | File explorer (`-` to open) |
| `claude.lua` | claudecode.nvim + claude-tmux.nvim (AI integration) |
| `copilot.lua` | GitHub Copilot |
| `debug.lua` | DAP + dapui for debugging |
| `git.lua` | Git helpers |
| `none-ls.lua` | Formatting via null-ls |
| `whichkey.lua` | Keybinding discovery (`<Space>?`) |
| `statusbar.lua` | Status line |
| `tmux.lua` | `<C-h/j/k/l>` split/pane navigation: herdr when `$HERDR_PANE_ID` is set, else vim-tmux-navigator |

**Leader key**: `<Space>`

**Key keybindings** (defined in `vim-options.lua` and plugin files):
- `<leader>t` — toggle floating terminal
- `<leader>a*` — Claude Code AI commands (toggle, focus, resume, add buffer, accept/deny diff)
- `<C-j>` — jump back to nvim from Claude tmux pane
- `<leader>bn/bp` — next/previous buffer
- `<leader>sv/sh` — vertical/horizontal split
- `<leader>rc` — edit vimrc (`init.lua`)

## Claude Code Integration (Neovim)

The `claude.lua` plugin sets up claudecode.nvim with tmux pane support:
- Uses `claude-tmux.nvim` to open Claude in a 30%-width tmux pane
- `<C-j>` jumps back to nvim from the Claude pane
- `<leader>ac` — toggle Claude, `<leader>af` — focus, `<leader>ar` — resume
- `<leader>aa/ad` — accept/deny diffs

## Tmux

Config at `tmux/.tmux.conf`. Uses TPM (Tmux Plugin Manager). Key plugins:
- `vim-tmux-navigator` — seamless `<C-h/j/k/l>` navigation between vim splits and tmux panes
- `tmux-onedark-theme` — matching colorscheme

Custom powerline theme: `tmux/.config/tmux-powerline/themes/jsully.sh`

## Herdr

[herdr TUI](https://herdr.dev/tui/) is used instead of tmux for running agents; don't nest it inside tmux (agent status detection breaks). Config: `herdr/.config/herdr/config.toml` — validate with `herdr config check`, reload with `herdr server reload-config`. Herdr's settings UI writes through the stow symlink into the repo.

- Theme: built-in `one-dark` overridden with onedark.nvim's "warmer" palette, `panel_bg = "reset"` for transparency.
- Navigation: `ctrl+h/j/k/l` run `navigate.sh`, which forwards the key if the pane's foreground process is vim/nvim/fzf, else calls `herdr pane focus`. At nvim's edge, `tmux.lua` calls `herdr pane focus`. A `ctrl+alt+hjkl` fallback is documented in the config.

## Zsh

- `zsh/.zshenv` — sets `XDG_CONFIG_HOME=$HOME/.config`  
- `zsh/.zshrc` — Oh My Zsh with custom `sully` theme, NVM, fzf, zoxide, `vim` aliased to `nvim`
- Custom theme: `oh-my-zsh/.oh-my-zsh/custom/themes/sully.zsh-theme`

## Adding a New Tool/Config

1. Create a new directory with the tool name
2. Mirror the target path structure inside it (e.g., `.config/tool/tool.conf`)
3. Run `stow <toolname> -t $HOME` or add a new `<tool>.sh` in the repo root
4. If there's an install step, follow the pattern in the existing root-level installer scripts (check for apt/brew/pacman, then stow)
