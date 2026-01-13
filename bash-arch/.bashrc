#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

NC="\[\e[0m\]" # no color
PS1="\[\e[32m\]\u@\h${NC}:\[\e[34m\]\w${NC}\$ " # prompt

# history-substring-search with arrow keys
bind "'\e[A': history-search-backward"
bind "'\e[B': history-search-forward"

# --- Aliases ---
alias ls='eza --oneline --color=always --icons=always --group-directories-first --git'
alias ll='eza --oneline --long --color=always --icons=always --group-directories-first --git'
alias la='eza --oneline --color=always --icons=always --all --group-directories-first'

alias grep='grep --color=auto'

alias ..="cd .."
alias c="clear -x"
alias e="exit"
alias sb="source ~/.bashrc"

alias ff="clear -x && pfetch"

alias lg="lazygit"
alias rmvim="rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim"

alias cdsfl="cd ~/qmk_firmware/keyboards/splitkb/aurora/sofle_v2/keymaps/sofle"
alias cmpsfl="qmk compile -kb splitkb/aurora/sofle_v2/rev1 -km sofle"

# --- FZF ---
# Set up fzf key bindings and fuzzy completion
source <(fzf --bash)

# fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

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
    cd)           fzf --preview "eza --tree --color=always {} | head -200" "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"                          "$@" ;;
    ssh)          fzf --preview "dig {}"                                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview"                "$@" ;;
  esac
}

# --- Fzf-git ---
source ~/Repository/fzf-git.sh/fzf-git.sh

# --- Zoxide ---
eval "$(zoxide init --cmd cd bash)"

# --- Yazi ---
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# --- Sessionizer ---
PATH="$PATH":"$HOME/.local/scripts/"
bind '"\C-f":"tmux-sessionizer\n"'

if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  pfetch
fi
