alias ls='ls --color=auto'
alias grep='grep --color=auto'

setopt prompt_subst

NEWLINE=$'\n'

PS1='%B%T%b %F{cyan}%0~%f$NEWLINE%F{cyan}~>%f '

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

autoload -U compinit
compinit

HISTSIZE=200
HISTFILE=~/.zsh_history
SAVEHIST=200

source ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept

export EDITOR=nvim

source ~/.config/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

if [[ -z $TMUX ]]; then
    tmux new -As jan 
fi
