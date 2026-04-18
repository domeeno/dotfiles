 # ~/.zshrc - minimal + useful

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""           # empty because we're using Starship for the prompt

# Plugins you want oh-my-zsh to load
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  fzf
  autojump
)

source $ZSH/oh-my-zsh.sh

# --------- completions ----------
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# --------- fzf keybindings & completion (if installed via pacman) ----------
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# --------- autojump ----------
[ -f /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh

# --------- starship prompt ----------
# initialize starship (make sure starship is installed)
eval "$(starship init zsh)"

# --------- dotfiles ---------
alias refresh='source ~/.zshrc'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='eza --oneline --icons --group-directories-first'
alias ll='ls -l --git --git-repos-no-status'
alias tree='eza --icons -T -L 3'
alias cat='bat'
alias n='nvim .'
alias py='python3'

function clone() {
  git clone git@github.com:domeeno/$1.git
}

# --------- zsh-autosuggestions (should be loaded by oh-my-zsh if in plugins)
# If not loaded, uncomment the line below (use when cloned manually)
# source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------- zsh-syntax-highlighting (MUST be last) ----------
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------- history & options ----------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt INC_APPEND_HISTORY       # write history immediately
setopt SHARE_HISTORY            # share history across sessions
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY

if [ -f ~/.alias ]; then
  source ~/.alias
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/dom/.lmstudio/bin"
# End of LM Studio CLI section

