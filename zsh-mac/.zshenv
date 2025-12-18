# Homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# User local bin
export PATH="$HOME/.local/bin:$PATH"

# JAVA
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"  # for compiler to find jdk

# Rust
. "$HOME/.cargo/env"

# node@24
export PATH="/opt/homebrew/opt/node@24/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@24/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@24/include"

# pnpm
export PNPM_HOME="/Users/unemotioned/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Neovim
export EDITOR="nvim"

# Nvim as man pager
export MANPAGER="/usr/local/bin/nvr -c 'Man!' -o -"

# Lazygit config path
export XDG_CONFIG_HOME="$HOME/.config"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"
