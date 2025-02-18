if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Turn off greeting message
set -g fish_greeting

set -gx EDITOR nvim

# Path to tmux-sessionizer script
set PATH "$PATH":"$HOME/.local/scripts/"

# Macro
bind \cf "tmux-sessionizer"

# pnpm
set -gx PNPM_HOME "/home/daniel/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Created by `pipx` on 2025-02-16 15:39:06
set PATH $PATH /home/daniel/.local/bin

starship init fish | source

# ----- FZF (fuzzy search) -----
fzf --fish | source

# Define colors
set -Ux FZF_FG "#a9b1d6"
set -Ux FZF_BG "#1a1b26"
set -Ux FZF_BG_HIGHLIGHT "#28344a"
set -Ux FZF_PURPLE "#bb9af7"
set -Ux FZF_BLUE "#7aa2f7"
set -Ux FZF_CYAN "#7dcfff"

# Set FZF options
set -Ux FZF_DEFAULT_OPTS "--color=fg:$FZF_FG,bg:$FZF_BG,hl:$FZF_PURPLE,fg+:$FZF_FG,bg+:$FZF_BG_HIGHLIGHT,hl+:$FZF_PURPLE,info:$FZF_BLUE,prompt:$FZF_CYAN,pointer:$FZF_CYAN,marker:$FZF_CYAN,spinner:$FZF_CYAN,header:$FZF_CYAN"

# ----- Bat (better cat) -----
set -Ux BAT_THEME tokyonight_night

# ----- Zoxide (better ls) -----
zoxide init fish | source

alias cd='z'

source ~/.config/fish/aliases.fish
