#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

NC="\[\e[0m\]" # no color
PS1="\[\e[32m\]\u@\h${NC} \[\e[34m\]\w${NC}\$ " # prompt

# history-substring-search with arrow keys
bind "'\e[A': history-search-backward"
bind "'\e[B': history-search-forward"

[[ -f ~/.bash_aliases ]] . ~/.bash_aliases
[[ -f ~/.bash_tools.sh ]] . ~/.bash_tools.sh
