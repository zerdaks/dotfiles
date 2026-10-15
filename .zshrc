# Interactive shell configuration. Environment and PATH live in .zprofile.

: ${HOMEBREW_PREFIX:=/opt/homebrew}
: ${XDG_CONFIG_HOME:=$HOME/.config}

# History
#
# EXTENDED_HISTORY is deliberately off: it prefixes each entry with a timestamp,
# which would break the line-oriented editing hd performs below.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# Completions
#
# Homebrew's site-functions supplies brew, git, just, eza, gh and others.
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
# No -C: it reuses ~/.zcompdump without rescanning fpath, so completions for
# tools installed after the dump was written are never picked up.
autoload -Uz compinit && compinit
# Homebrew's git completion only matches from the start of a filename, so
# "g add pro<Tab>" never finds .zprofile. Load zsh's built-in one instead.
if [[ -r /usr/share/zsh/$ZSH_VERSION/functions/_git ]]; then
  unfunction _git
  autoload -Uz /usr/share/zsh/$ZSH_VERSION/functions/_git
fi
zstyle ':completion:*' menu select
# Case-insensitive prefix, then substring (fish-style).
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'm:{a-z}={A-Za-z} l:|=* r:|=*'

# Vi key bindings
bindkey -v
export KEYTIMEOUT=1

# bindkey -v binds backspace and friends to vi-* widgets that refuse to delete
# past the point insert mode was last entered, so they do nothing on recalled
# history or text typed before the last Esc. The plain widgets have no such
# restriction.
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^U' backward-kill-line

# fish shapes the cursor per vi mode out of the box (fish_vi_cursor); zsh does
# not. Block is normal, beam is insert. Must precede starship's init, which
# wraps a pre-existing zle-keymap-select rather than replacing it.
vi_cursor() { [[ $KEYMAP == vicmd ]] && print -n '\e[2 q' || print -n '\e[6 q' }
zle -N zle-keymap-select vi_cursor
zle -N zle-line-init vi_cursor

# Aliases

# brew's ask mode is on by default and prompts whenever a plan pulls in
# packages beyond the ones named. b skips it; type brew in full to be asked.
alias b='HOMEBREW_NO_ASK=1 brew'
alias back=backup_run
alias dback=backup_dry_run

alias c=clear
alias cat=bat
alias claude='claude --dangerously-skip-permissions'

alias diff='diff --color'

alias g=git

# zsh's history shows only the last 16 entries; start from event 1 for all of them
alias h='history 1'

alias j=just

alias ls='eza --icons=auto'
alias ll='eza -lh --icons --git'
alias lla='ll -a'
alias llt='eza --tree --icons -a --ignore-glob=.git --level=2'

alias m=just

# exec rather than source: re-sourcing double-loads zsh-syntax-highlighting
alias r='exec zsh'
alias rmds='find . -name .DS_Store -delete'

alias tm=tmux
alias tokei='tokei --hidden'

alias unmount='diskutil eject'
alias untar='tar -xzvf'
alias unzip='7zz x'

alias vim=nvim
alias v=nvim

# Functions

# zsh has no equivalent of fish's `history delete`, and editing HISTFILE leaves
# the entry in the in-memory list. Both helpers below exec a fresh shell so the
# entry is gone from the file and from the current session's recall.

history_clear() {
    : >| "$HISTFILE"
    exec zsh
}
alias hc=history_clear

history_delete() {
    fc -W
    # zsh records the invocation before running it, so drop that entry first
    [[ $(tail -n 1 "$HISTFILE") == hd ]] && sed -i '' -e '$d' "$HISTFILE"
    sed -i '' -e '$d' "$HISTFILE"
    exec zsh
}
alias hd=history_delete

# takes source and destination; trailing arguments are passed through to rsync.
# The source is normalized to always end in / so a bare directory (e.g. `back
# ~/dotfiles .`) merges its contents into the destination, same as `.` does,
# instead of nesting the source dir one level deeper.
backup_run() {
    local src=$1
    shift
    [[ -d $src && $src != */ ]] && src+=/
    rsync "$src" "$@" \
        --verbose \
        --archive \
        --delete \
        --human-readable \
        --exclude .git/
}

backup_dry_run() {
    backup_run "$@" --dry-run
}

# Per-tool configuration
for __zsh_conf in "$XDG_CONFIG_HOME"/zsh/*.zsh(N); do
    source "$__zsh_conf"
done
unset __zsh_conf

# Tool initialization
#
# zsh-syntax-highlighting must be sourced last; it wraps the widgets the
# preceding integrations install.
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
export FZF_CTRL_R_OPTS='--reverse' # Ctrl-R history search with the prompt on top
source <(fzf --zsh)
eval "$(zoxide init zsh)" # provides z and zi
eval "$(starship init zsh)"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Machine-local overrides
#
# Sourced last so it can override anything above. Kept out of version control
# (see .gitignore) for per-machine secrets and settings.
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
