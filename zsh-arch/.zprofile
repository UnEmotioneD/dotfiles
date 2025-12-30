# hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

# ssh with kitty
export TERM=xterm-256color

# qt app scaling
export QT_SCALE_FACTOR=2
export QT_SCREEN_SCALE_FACTORS=2
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# npm global packages
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

# pnpm
export PNPM_HOME="/home/unemotioned/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Rust
. "$HOME/.cargo/env"
