# to avode collision with transiant prompt
if [[ "$TERM_PROGRAM" != "vscode" && "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
  nerdfetch
fi

# transiant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git web-search)

source $ZSH/oh-my-zsh.sh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion styling: case in-sensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- FZF ---
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Fzf theme
fg="#a9b1d6"
bg="#1a1b26"
bg_highlight="#28344a"
purple="#bb9af7"
blue="#7aa2f7"
cyan="#7dcfff"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

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
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"                          "$@" ;;
    ssh)          fzf --preview 'dig {}'                                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview"                "$@" ;;
  esac
}

# --- Fzf-git ---
source ~/Repository/fzf-git.sh

# --- Bat ---
# $ bat cache --build
export BAT_THEME=tokyonight_night

# --- Eza ---
alias ls="eza --oneline --color=always --icons=always --group-directories-first --git"

# --- Zoxide ---
eval "$(zoxide init --cmd cd zsh)"

# --- Yazi ---
# q: move to dir on exit
# Q: quite without changing directory
yz() {
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
bindkey -s ^f "tmux-sessionizer\n"

# --- Alias ---
alias c="clear -x"
alias e="exit"
alias sz="source ~/.zshrc"

alias sys="clear -x && nerdfetch"
alias sysup="brew update && brew upgrade && brew upgrade --cask && brew autoremove && brew cleanup"

alias tc="tmux clear-history && clear -x"
alias lg="lazygit"
alias vim="nvim ."
alias rmvim="rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim"
