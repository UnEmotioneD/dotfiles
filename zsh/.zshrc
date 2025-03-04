# For transiant prompt (must be at top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search web-search)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# fetch
if [[ "$TERM_PROGRAM" != "code" ]]; then
    neofetch
fi

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1024
HISTSIZE=1024
HISTDUP=erase               # erase duplicates in .zhistory
setopt appendhistory        # append executed cmd to .zhistory rather then overwriting it
setopt sharehistory         # share cmds through out sessions
setopt hist_ignore_space    # add space before cmd to keep it away from history
setopt hist_ignore_all_dups # keep duplicates away
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups    # don't show duplicates on suggestion

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- FZF ---
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
source <(fzf --zsh)

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

source ~/Repository/fzf-git.sh/fzf-git.sh

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

ni() {
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
eval "$(zoxide init --cmd cd zsh)"

# --- Eza (better ls) ---
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"

# --- Bat (better cat) ---
export BAT_THEME=tokyonight_night

# --- Yazi ---
# Move to directory when exiting yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command bat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# --- sessionizer ---
PATH="$PATH":"$HOME/.local/scripts/"

bindkey -s ^f "tmux-sessionizer\n"

# --- my alias ---
alias c="clear"
alias e="exit"
alias so="source"

alias n="nvim"
alias lg="lazygit"

alias python="python3"
alias von="source venv/bin/activate"
alias voff="deactivate"

alias brewup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'

alias rmnvim='rm -rf ~/.local/share/nvim/ && rm -rf ~/.local/state/nvim/ && rm -rf ~/.cache/nvim/'
alias rmkick='rm -rf ~/.local/share/KickStart/ && rm -rf ~/.local/state/KickStart/ && rm -rf ~/.cache/KickStart/'
alias rmprime='rm -rf ~/.local/share/ThePrimeagen/ && rm -rf ~/.local/state/ThePrimeagen/ && rm -rf ~/.cache/ThePrimeagen/'

# --- Neovim config selector ---
alias kick="NVIM_APPNAME=KickStart nvim"
alias prime="NVIM_APPNAME=ThePrimeagen nvim"

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
bindkey -s ^a "nvims\n"

source ~/.zshenv
