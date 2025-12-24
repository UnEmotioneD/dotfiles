# Homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# User local bin
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"

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

# JAVA
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"  # for compiler to find jdk

# Rust
. "$HOME/.cargo/env"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"
