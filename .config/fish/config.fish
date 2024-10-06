set fish_greeting ""

alias arc 'open -a Arc'

alias c clear
alias cat 'bat'
alias chrome 'open -a Google\ Chrome'

alias diff colordiff

alias g git

alias hc 'history clear'
alias hd 'history delete'

alias ll 'eza -l -g --icons'
alias lla 'll -a'
alias llt 'lla --tree --level=2 --ignore-glob=".git"'

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

# searches for files matching the provided pattern
function findfz
	find . -name "*$argv*" | fzf | pbcopy
	echo -e "\e[31mCopied to clipboard\e[0m"
	pbpaste
end

# searches for text matching the provided pattern
function grepfz
	grep -r $argv . --exclude-dir='.git' | fzf | cut -d ':' -f 1 | pbcopy
	echo -e "\e[31mCopied to clipboard\e[0m"
	pbpaste
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
