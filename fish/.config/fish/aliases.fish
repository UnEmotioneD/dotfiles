# Alias
alias c='clear -x' # clear terminal window without clearing the scroll history
alias e='exit'
alias lg='lazygit'

alias sofi='source ~/.config/fish/config.fish'

# For resetting nvim plugins
alias rmnvim='rm -rf ~/.local/share/nvim/ && rm -rf ~/.local/state/nvim/'
alias rmprime='rm -rf ~/.local/share/ThePrimeagen/ && rm -rf ~/.local/state/ThePrimeagen/'
alias rmkick='rm -rf ~/.local/share/kick/ && rm -rf ~/.local/state/kick/'

alias sd='sudo shutdown now'
alias rb='sudo reboot now'

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
