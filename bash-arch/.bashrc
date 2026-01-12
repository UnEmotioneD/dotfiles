#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# system info fetch
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  pfetch
fi

# history substring search with arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.bash_tools.sh ]] && source ~/.bash_tools.sh

# --- Prompt ---
# source git-prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  source /usr/share/git/completion/git-prompt.sh
fi

# git status signs
export GIT_PS1_SHOWDIRTYSTATE=1     # * and +
export GIT_PS1_SHOWSTASHSTATE=1     # $
export GIT_PS1_SHOWUNTRACKEDFILES=1 # %
export GIT_PS1_SHOWUPSTREAM=auto    # ⇡⇣

# colors
NC='\[\e[0m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'

# prompt (recommended at bottom) 
PS1="${GREEN}\u@\h${NC}:${BLUE}\w${YELLOW}\$(__git_ps1 ' (%s)')${NC}\$ "
