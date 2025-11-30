#! /bin/bash
set -ex

# Theme Name
NEW_THEME="sully"
# Path to the .zshrc file
ZSHRC_FILE="$HOME/.zshrc"


# ============================================================================================

# Set shell
sudo apt update && sudo apt install -y zsh
sudo chsh -s $(which zsh)
touch ${HOME}/.zshrc

# Install Tools
sudo snap install alacritty --classic
sudo snap install nvim --classic
sudo snap install yazi --classic
echo "alias vim=nvim" >> ${HOME}/.zshrc


cd "$(dirname "$0")"

# Install Fonts
curl -sSLo jetbrains-mono.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip -qq jetbrains-mono.zip -d jetbrains-mono
mkdir -p ${HOME}/.fonts
sudo mv jetbrains-mono/fonts/ttf/*.ttf ${HOME}/.fonts
sudo fc-cache -f -v
rm -rf jetbrains-mono.zip jetbrains-mono

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

cp -R ./dotfiles/.oh-my-zsh $HOME
cp -R ./dotfiles/.config $HOME

# Replace oh-my-zsh theme.
sed -i.bak "s/^ZSH_THEME=\"[^\"]*\"/ZSH_THEME=\"$NEW_THEME\"/" "$ZSHRC_FILE"
