default:
	@echo "make config-brew"
	@echo "make install-fish"
	@echo "make config-fish"
	@echo "make install-fonts"
	@echo "make install-git-utils"
	@echo "make install-go"
	@echo "make install-lua"
	@echo "make install-nvim"
	@echo "make install-postgres"
	@echo "make install-ruby"
	@echo "make install-stow"
	@echo "make install-tmux"
	@echo "make install-utils"

config-brew:
	brew tap homebrew/aliases
	brew alias clean='cleanup && brew doctor'

install-fish:
	brew install fish
	# install a plugin manager
	fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
	# install a fish prompt
	fish -c "fisher install IlanCosman/tide@v5"
	# install directory jumping
	fish -c "fisher install jethrokuan/z"

config-fish:
	tide configure

install-fonts:
	brew tap homebrew/cask-fonts
	brew install font-hack-nerd-font

install-git-utils:
	brew install gitleaks
	# install a commit message formatter
	brew install npm
	npm install -g commitizen

intall-go:
	brew install go
	# install a language server
	go install golang.org/x/tools/gopls@latest

install-lua:
	brew install lua
	brew install luarocks

install-nvim: install-telescope-dependencies
	brew install nvim

install-telescope-dependencies:
	brew install fd
	brew install ripgrep

install-postgres:
	brew install postgresql
	brew services start postgresql

install-ruby:
	brew install rbenv
	# install the latest ruby version
	rbenv install $$(rbenv install -l | grep -v - | tail -1) || true
	# set the latest ruby version as global
	rbenv global $$(rbenv install -l | grep -v - | tail -1)
	# required by ruby-lsp
	(cd $(HOME) && rbenv local $$(rbenv install -l | grep -v - | tail -1))

intall-stow:
	brew install stow
	stow .

install-tmux:
	brew install tmux
	# install a plugin manager
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm || true

install-utils:
	brew install bat
	brew install colordiff
	brew install eza
	brew install fzf
	brew install tokei

.PHONY: default \
	config-brew \
	install-fish \
	config-fish \
	install-fonts \
	install-git-utils \
	install-go \
	install-lua \
	install-nvim \
	install-postgres \
	install-ruby \
	install-stow \
	install-tmux \
	install-utils

.SILENT: default \
	config-brew \
	install-fish \
	config-fish \
	install-fonts \
	install-git-utils \
	install-go \
	install-lua \
	install-nvim \
	install-postgres \
	install-ruby \
	install-stow \
	install-tmux \
	install-utils
