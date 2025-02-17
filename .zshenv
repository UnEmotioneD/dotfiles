# Global bin dir
export PATH="/opt/homebrew/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/unemotioned/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

# Luarock
export PATH="/opt/homebrew/opt/lua@5.1/bin:$PATH"

# Hererocks
export PATH="$HOME/.luarocks/bin:$PATH"
export LUA_PATH="$HOME/.luarocks/share/lua/5.1/?.lua;$LUA_PATH"
export LUA_CPATH="$HOME/.luarocks/lib/lua/5.1/?.so;$LUA_CPATH"
