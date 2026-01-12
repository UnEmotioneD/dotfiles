# to avode collision with transiant prompt
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  fastfetch
fi

# transiant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_PLUGINS="$ZSH/custom/plugins"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git web-search)

source $ZSH/oh-my-zsh.sh

source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_PLUGINS/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- FZF ---
# git installed fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
source ~/Repository/fzf-git.sh/fzf-git.sh

# --- Bat ---
# $ bat cache --build
export BAT_THEME=tokyonight_night
# to avoid collision
alias bat="batcat"

# --- Eza ---
alias ls="eza --oneline --color=always --icons=always --group-directories-first --git"

# --- Zoxide ---
eval "$(zoxide init --cmd cd zsh)"

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
bindkey -s ^f "tmux-sessionizer\n"

# --- Alias ---
alias c="clear -x"
alias e="exit"
alias sz="source ~/.zshrc"

alias ff="clear -x && fastfetch"
alias aptup="sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean"

alias lg="lazygit"
alias vim="nvim ."
alias rmvim="rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim"

# --- ROS ---
export ROS_DOMAIN_ID=24

if [[ -f /opt/ros/jazzy/setup.zsh ]]; then
  . /opt/ros/jazzy/setup.zsh
fi

if [[ -f ~/Developer/ros2-workspace/install/local_setup.zsh ]]; then
  . ~/Developer/ros2-workspace/install/local_setup.zsh
fi
