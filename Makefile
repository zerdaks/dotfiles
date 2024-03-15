all: brew-config brew-install additional-install

# Configure Homebrew
brew-config:
	brew tap homebrew/aliases
	brew alias clean='cleanup && brew doctor'

# Install dependencies using Homebrew
brew-install:
	brew install bat

	brew install colordiff

	brew install eza

	brew install fish
	brew install fzf

	brew install gitleaks
	brew install glow
	brew install gnupg
	brew install go

	brew install jdtls

	brew install lua
	brew install luarocks

	brew install npm
	brew install nvim

	brew install p7zip
	brew install python3

	brew install postgresql@14
	brew services start postgresql@14

	brew install rbenv

	brew install stow

	brew install tmux

	brew install wget

	# install telescope dependencies
	brew install fd
	brew install ripgrep

	# install a window manager for macOS
	brew install koekeishiya/formulae/skhd
	brew install koekeishiya/formulae/yabai
	skhd --start-service
	yabai --start-service

	brew tap homebrew/cask-fonts
	brew install font-hack-nerd-font

# Install additional dependencies
additional-install:
	# install a plugin manager for fish
	curl -sL https://git.io/fisher | fish && fish -c "fisher install jorgebucaran/fisher"

	# install fish plugins
	fish -c "fisher install IlanCosman/tide@v5" # a prompt for fish
	fish -c "fisher install jethrokuan/z" # directory jumping

	# install a plugin manager for tmux
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm || true

	# install the latest version of Ruby
	rbenv install $$(rbenv install -l | grep -v - | tail -1) || true
	rbenv global $$(rbenv install -l | grep -v - | tail -1) || true

	# install a commit message formatter for Git
	npm install -g commitizen

	# install a language server for Go
	go install golang.org/x/tools/gopls@latest

.PHONY: all brew-install additional-install brew-config
