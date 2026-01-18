#
# ~/.bash_aliases
#

alias ls='eza --oneline --color=always --icons=always --group-directories-first --git'
alias ll='eza --oneline --long --color=always --icons=always --group-directories-first --git'
alias la='eza --oneline --color=always --icons=always --all --group-directories-first'

alias grep='grep --color=auto'

alias ..='cd ..'
alias c='clear -x'
alias e='exit'
alias sb='source ~/.bashrc'

alias ff='clear -x && pfetch'

alias lg='lazygit'
alias rmvim='rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'

alias cdsfl='cd ~/qmk_firmware/keyboards/splitkb/aurora/sofle_v2/keymaps/sofle'
alias cmpsfl='qmk compile -kb splitkb/aurora/sofle_v2/rev1 -km sofle'
