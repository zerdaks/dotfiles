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
	@echo "make install-yabai"

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
	brew install tig
	# install a commit message formatter
	brew install npm
	npm install -g commitizen

intall-go:
	brew install go
	# install a language server for Go
	go install golang.org/x/tools/gopls@latest

install-lua:
	brew install lua
	brew install luarocks

install-nvim:
	brew install nvim
	# install telescope dependencies
	brew install fd
	brew install ripgrep
	# install language servers
	brew install jdtls

install-postgres:
	brew install postgresql
	brew services start postgresql

install-ruby:
	brew install rbenv
	rbenv install $$(rbenv install -l | grep -v - | tail -1) || true
	rbenv global $$(rbenv install -l | grep -v - | tail -1)
	# required for Mason
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
	brew install glow

install-yabai:
	brew install koekeishiya/formulae/skhd
	brew install koekeishiya/formulae/yabai
	skhd --start-service
	yabai --start-service

.PHONY: default
