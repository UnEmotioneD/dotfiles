alias bat="batcat"

alias ls='eza --oneline --color=always --icons=always --group-directories-first --git'
alias ll='eza --oneline --long --color=always --icons=always --group-directories-first --git'
alias la='eza --oneline --color=always --icons=always --all --group-directories-first'

alias ..='cd ..'
alias c='clear -x'
alias e='exit'
alias sb='source ~/.bashrc'

alias ff='clear -x && fastfetch'
alias aptup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean'

alias lg='lazygit'
alias rmvim='rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'

# --- Pinky ---
alias sp='ssh pinky@192.168.4.1'
alias teleop='ros2 run teleop_twist_keyboard teleop_twist_keyboard'
alias rviz='ros2 launch pinky_navigation map_view.launch.xml'
alias readmap='ros2 launch pinky_navigation nav2_view.launch.xml'

# --- Jetcobot ---
alias sj='ssh jetcobot@192.168.5.1'
