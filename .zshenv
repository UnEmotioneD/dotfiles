# Global bin dir
export PATH="/opt/homebrew/bin:$PATH"

# JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

# Rust
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/unemotioned/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
