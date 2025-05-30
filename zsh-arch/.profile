export PATH="$HOME/.local/bin:$PATH"

# hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

# ssh with kitty
export TERM=xterm-256color

# Fcitx5 for Wayland input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus  # for some Wayland apps (fcitx5 fallback)
export XIM=fcitx
export XIM_PROGRAM=fcitx

export QT_SCALE_FACTOR=2
export QT_SCREEN_SCALE_FACTORS=2
export QT_AUTO_SCREEN_SCALE_FACTOR=0

export EDITOR=nvim
export VISUAL=nvim

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
