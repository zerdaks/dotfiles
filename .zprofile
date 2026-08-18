# Login shell environment. Interactive settings live in .zshrc.

# add Homebrew to path and set HOMEBREW_PREFIX, MANPATH, INFOPATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# keep path entries unique so this file is safe to source more than once
# (tmux starts each pane as a login shell)
typeset -U path PATH

# set XDG config home so XDG-aware tools (e.g. lazygit) use ~/.config on macOS
export XDG_CONFIG_HOME="$HOME/.config"

export GOPATH="$HOME/go"

path=(
    "$HOMEBREW_PREFIX/opt/make/libexec/gnubin"   # GNU Make
    "$HOMEBREW_PREFIX/opt/postgresql@18/bin"     # keg-only, so not linked by default
    "$HOMEBREW_PREFIX/opt/openjdk/bin"           # Java
    "$HOME/.luarocks/bin"                        # Lua package manager
    "$GOPATH/bin"
    "$HOME/.local/bin"
    "$HOME/.opencode/bin"
    $path
)

# configure Node.js
export NODE_PATH="$HOMEBREW_PREFIX/lib/node_modules/"

# set custom colors for jq
export JQ_COLORS='36;1:35;1:33;1:34;1:38;1:32;1:90;1:97;1:49'

# starship draws the virtualenv indicator itself
export VIRTUAL_ENV_DISABLE_PROMPT=true
