alias bat="batcat"

alias ls='eza --oneline --color=always --icons=always --group-directories-first --git'
alias la='eza --oneline --color=always --icons=always --all --group-directories-first'
alias ll='eza --oneline --long --color=always --icons=always --group-directories-first --git'

alias ..='cd ..'
alias c='clear -x'
alias e='exit'
alias sb='source ~/.bashrc'

alias ff='clear -x && fastfetch'
alias aptup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean'

alias tc='tmux clear-history && clear -x'
alias lg='lazygit'
alias vim='nvim .'
alias rmvim='rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'
