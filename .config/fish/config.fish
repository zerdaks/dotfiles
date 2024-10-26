set fish_greeting ""

alias arc 'open -a Arc'

alias c clear
alias cat 'bat'
alias chrome 'open -a Google\ Chrome'

alias diff colordiff

alias fh 'commandline -r (history | fzf)'

alias g git

alias hc 'history clear'
alias hd 'history delete'

alias ll 'eza -l -g --icons'
alias lla 'll -a'

alias r 'source ~/.config/fish/config.fish'
alias rmds 'find ~/Documents/ -name ".DS_Store" | xargs rm'

alias tm tmux

alias unmount 'diskutil eject'
alias untar 'tar -xvzf'
alias unzip '7z x'

alias vim nvim
alias vimdiff 'nvim -d'

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
		--dry-run \
		--delete \
		--human-readable \
		--exclude .git/
end

function ff
    set selected (find . -name "*$argv*" -not -path "./.git/*" -not -path "./." | fzf)
    if test -n "$selected"
        printf "%s" "$selected" | pbcopy
    end
end

function fgrep
    set selected (grep -r $argv . --exclude-dir=".git" | fzf --with-nth=2..)
    if test -n "$selected"
        set filename (echo "$selected" | awk -F: '{print $1}')
        printf "%s" "$filename" | pbcopy
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

# add homebrew to path
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH

# add go to path
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# add java to path
set -gx PATH (brew --prefix)/opt/openjdk/bin $PATH

# add luarocks to path
set -gx PATH $HOME/.luarocks/bin $PATH

# add make to path
set -gx PATH (brew --prefix)/opt/make/libexec/gnubin $PATH

# set up node
set -gx NODE_PATH (brew --prefix)/lib/node_modules/

# set up rbenv
status --is-interactive; and rbenv init - fish | source

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
	source $LOCAL_CONFIG
end

# set up vi key bindings
set -g fish_key_bindings fish_vi_key_bindings
