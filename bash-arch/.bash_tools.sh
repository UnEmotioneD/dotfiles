#
# ~/.bash_tools.sh
#

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
# q: move to dir on exit
# Q: quite without changing directory
y() {
  local tmp
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"

  command yazi "$@" --cwd-file="$tmp"
  if [[ -f $tmp ]]; then
    local cwd
    cwd="$(<"$tmp")"
    if [[ -n $cwd && $cwd != $PWD ]]; then
      cd -- "$cwd"
      zle reset-prompt 2>/dev/null
    fi
  fi
  rm -f -- "$tmp"
}

# --- Sessionizer ---
PATH="$PATH":"$HOME/.local/scripts/"
bind '"\C-f":"tmux-sessionizer\n"'
