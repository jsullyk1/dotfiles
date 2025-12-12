# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"
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

if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]]; then
  tmux attach-session -t default || tmux new-session -s default
fi
