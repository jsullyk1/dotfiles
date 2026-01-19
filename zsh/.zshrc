export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sully"

plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export PATH="/snap/bin:$HOME/.local/bin:$HOME/.opencode/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias kiss="kitten ssh"

SOURCE_DIR="$XDG_CONFIG_HOME/zsh"
if [[ -d "$SOURCE_DIR" ]] then
  for file in "$SOURCE_DIR"/*.zsh; do
    # Check if the file exists (handles cases where no .zsh files are found)
    if [[ -f "$file" ]]; then
      echo "Sourcing: $file"
      source "$file"
    fi
  done
fi

# Fuzzy finding
# Set up fzf key bindings and fuzzy completion
if [[ $s(command -v rg) ]]; then
    export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'
fi

if [[ $s(command -v zoxide) ]]; then
    eval "$(zoxide init --cmd cd zsh)"
fi
