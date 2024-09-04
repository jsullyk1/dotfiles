#! /bin/bash

# Theme Name
ZSH_THEME="sully"
# Path to the .zshrc file
ZSHRC_FILE="$HOME/.zshrc"

# ============================================================================================

cd "$(dirname "$0")"

if [ ! -d "$DIRECTORY" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

cp -R ./dotfiles/.oh-my-zsh $HOME

# Replace oh-my-zsh theme.
sed -i.bak "s/^ZSH_THEME=\"[^\"]*\"/ZSH_THEME=\"$NEW_THEME\"/" "$ZSHRC_FILE"