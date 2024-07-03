alias ls='ls --color=auto'
alias grep='grep --color=auto'

setopt prompt_subst

NEWLINE=$'\n'

PS1='%B%T%b %F{cyan}%0~%f$NEWLINE%F{cyan}~>%f '

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

autoload -U compinit
compinit

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

source ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept

export EDITOR=nvim

source ~/.config/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export XDG_CONFIG_HOME=~/.config

if [[ -z $TMUX ]]; then
    tmux new -As jan 
fi
