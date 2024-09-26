# Aliases for convenience
alias ls='ls --color=auto'   # Colorize ls output
alias grep='grep --color=auto'  # Colorize grep output
alias c='clear'  # Shortcut for clearing the terminal

# Enable prompt substitution
setopt prompt_subst

# Define newline character for readability
NEWLINE=$'\n'

# Custom prompt configuration
PS1='%B%T%b %F{cyan}%0~%f$NEWLINE%F{cyan}~>%f '  # Timestamp, current directory in cyan

# History search key bindings
bindkey '^K' history-search-backward  # Ctrl+P to search backward in history
bindkey '^J' history-search-forward   # Ctrl+N to search forward in history

# Initialize zsh completion system
autoload -U compinit
compinit

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory   # Append to history file instead of overwriting
setopt sharehistory    # Share history across sessions
setopt hist_ignore_space    # Ignore commands starting with space in history
setopt hist_ignore_all_dups  # Ignore all duplicate commands in history
setopt hist_save_no_dups     # Don't save consecutive duplicate commands
setopt hist_ignore_dups      # Ignore duplicate commands in history
setopt hist_find_no_dups     # Do not display duplicates in history search results

# Source zsh autosuggestions plugin
source ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept  # Ctrl+Y to accept autosuggestion

# Set default editor to neovim
export EDITOR=nvim

# Syntax highlighting for zsh
source ~/.config/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF (fuzzy finder) options and colors
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Set XDG_CONFIG_HOME directory
export XDG_CONFIG_HOME=~/.config

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Case-insensitive completion

# Use dircolors to set up colors for file listing in completion
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Initialize fzf for zsh
eval "$(fzf --zsh)"

eval "$(zoxide init zsh --cmd cd)"

# Start tmux session if not already inside a tmux session
# if [[ -z $TMUX ]]; then
#     tmux new -As jan  # Start new tmux session named 'jan'
# fi
export PATH=$PATH:$HOME/go/bin
