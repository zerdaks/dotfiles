set fish_greeting ""

alias c clear
alias cat bat

alias diff colordiff

alias g git

alias hc 'history clear'
alias hd 'history delete'

alias ll 'eza -l -g --icons'
alias lla 'll -a'

alias m make

alias r 'source ~/.config/fish/config.fish'
alias rmds 'find ~/Documents/ -name ".DS_Store" | xargs rm'

alias tm tmux
alias tokei 'tokei --hidden'

alias unmount 'diskutil eject'
alias untar 'tar -xvzf'
alias unzip '7z x'

alias vim nvim

function back
    rsync $argv[1] $argv[2] \
        --verbose \
        --archive \
        --delete \
        --human-readable \
        --exclude .git/
end

function dback
    rsync $argv[1] $argv[2] \
        --verbose \
        --archive \
        --delete \
        --human-readable \
        --dry-run \
        --exclude .git/
end

function hf
    set cmd (history | fzf --header "Pick a command to run")
    if test -n "$cmd"
        commandline -r "$cmd"
        commandline -f execute
    end
end

function llt
    set dir "."
    set level 2

    if test (count $argv) -gt 0
        if string match -r '^[0-9]+$' $argv[1]
            set level $argv[1]
        else
            set dir $argv[1]
        end

        if test (count $argv) -gt 1
            set level $argv[2]
        end
    end

    lla --tree --level=$level --ignore-glob=".git" $dir
end

# add Homebrew to path
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH

# add Go to path
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# add Java to path
set -gx PATH (brew --prefix)/opt/openjdk/bin $PATH

# add Lua package manager to path
set -gx PATH $HOME/.luarocks/bin $PATH

# add GNU Make to path
set -gx PATH (brew --prefix)/opt/make/libexec/gnubin $PATH

# configure Node.js
set -gx NODE_PATH (brew --prefix)/lib/node_modules/

# configure Ruby version manager
status --is-interactive; and rbenv init - fish | source

# use a local configuration file if it exists
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# set up Vi key bindings
set -g fish_key_bindings fish_vi_key_bindings

# use Neovim to open man pages
set -x MANPAGER 'nvim +Man!'
