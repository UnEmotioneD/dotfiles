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

# User local bin
export PATH="$HOME/.loca/bin:$PATH"

# Rust
. "$HOME/.cargo/env"

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases
[[ -f ~/.zsh_tools.sh ]] && . ~/.zsh_tools.sh
[[ -f ~/.zsh_local.sh ]] && . ~/.zsh_local.sh
[[ -f ~/.p10k.zsh ]] && . ~/.p10k.zsh
