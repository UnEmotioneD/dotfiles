#               __
#   ____  _____/ /_  ___  ____ _   __
#  /_  / / ___/ __ \/ _ \/ __ \ | / /
#   / /_(__  ) / / /  __/ / / / |/ /
#  /___/____/_/ /_/\___/_/ /_/|___/
#


# Rust
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/unemotioned/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Global bin dir
export PATH="/opt/homebrew/bin:$PATH"

# Neovim
export EDITOR="nvim"

# Lazygit config path
export XDG_CONFIG_HOME="$HOME/.config"

# If you need to have openjdk@17 first in your PATH, run:
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# For compilers to find openjdk@17 you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# Nvim as man pager
export MANPAGER="/usr/local/bin/nvr -c 'Man!' -o -"
