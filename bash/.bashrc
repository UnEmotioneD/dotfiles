#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Fetch system info
pfetch
alias fetch='pfetch'

# Color codes
BLACK='\[\033[01;30m\]'
RED='\[\033[01;31m\]'
GREEN='\[\033[01;32m\]'
YELLOW='\[\033[01;33m\]'
BLUE='\[\033[01;34m\]'
MAGENTA='\[\033[01;35m\]'
CYAN='\[\033[01;36m\]'
RESET='\[\033[00m\]'

# Function to parse the current Git branch
parse_git_branch() {
  git branch --no-color 2>/dev/null | sed -n '/^\*/ s/^\* \(.*\)/ (\1)/p'
}

# Set PS1 with colors
PS1="${GREEN}\w${CYAN}\$(parse_git_branch)${MAGENTA}\n\$ ${RESET}"

alias grep='grep --color=auto'

alias c="clear -x"
alias e="exit"
alias so="source"
alias ..="cd .."

alias n="nvim"
alias lg="lazygit"

alias python="python3"
alias von="source venv/bin/activate"
alias voff="deactivate"

alias rmnvim="rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim"
alias rmkick="rm -rf ~/.local/share/KickStart && rm -rf ~/.local/state/KickStart"
alias rmprime="rm -rf ~/.local/share/ThePrimeagen && rm -rf ~/.local/state/ThePrimeagen"

# --- FZF ---
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
source <(fzf --bash)

# Use fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

source ~/repo/fzf-git.sh/fzf-git.sh

# Fzf theme to tokyonight
fg="#a9b1d6"
bg="#1a1b26"
bg_highlight="#28344a"
purple="#bb9af7"
blue="#7aa2f7"
cyan="#7dcfff"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo ${}'"                          "$@" ;;
        ssh)          fzf --preview 'dig {}'                                   "$@" ;;
        *)            fzf --preview "$show_file_or_dir_preview"                "$@" ;;
    esac
}

cdf() {
    local dir
    dir=$(find ${1:-.} -mindepth 1 -type d 2>/dev/null | fzf --preview 'tree -C {} | head -50') && cd "$dir"
}

nvimf() {
    local file
    file=$(find ${1:-.} -type f -o -type d 2>/dev/null | fzf --preview '
        if [ -d {} ]; then
          tree -C {} | head -50
        else
          bat --style=numbers --color=always --line-range=:50 {}
        fi
    ') && nvim "$file"
}

# --- Zoxide (better cd) ---
eval "$(zoxide init --cmd cd bash)"

# --- Eza (better ls) ---
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"

# --- Bat (better cat) ---
export BAT_THEME=tokyonight_night

# --- Yazi ---
# Move to directory when exiting yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# --- Sessionizer ---
PATH="$PATH":"$HOME/.local/scripts/"
bind '"\C-f": "tmux-sessionizer\n"'

# --- Neovim config selector ---
alias nvim="env NVIM_APPNAME=nvim nvim"
alias kick="env NVIM_APPNAME=KickStart nvim"
alias prime="env NVIM_APPNAME=ThePrimeagen nvim"

function nvims() {
    items=("Default" "ThePrimeagen" "KickStart")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ $config == "Default" ]]; then
        config=""
    fi
    env NVIM_APPNAME=$config nvim $@
}
bind '"\C-a": "nvims\n"'

# pnpm
export PNPM_HOME="/home/unemotioned/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.cargo/env"

source ~/.profile
