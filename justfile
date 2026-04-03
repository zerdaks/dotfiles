# Configure Homebrew aliases
[group('brew')]
brew-config:
    @brew tap homebrew/aliases
    @brew alias clean='cleanup && brew doctor'

# Install fish shell and plugins
[group('shell')]
fish-install:
    @brew install fish
    @fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher" # install a plugin manager
    @fish -c "fisher install IlanCosman/tide@v5" # install a fish prompt
    @fish -c "fisher install jethrokuan/z" # install directory jumping
    @fish -c "fisher list" # show installed plugins

# Configure fish shell
[group('shell')]
fish-config:
    @fish -c 'tide configure'
    @fish -c 'fish_config' || true

# Install stow
[group('dotfiles')]
stow-install:
    @brew install stow

# Apply stow to create symlinks for dotfiles
[group('dotfiles')]
stow-apply: stow-install
    @stow .

# Install tmux and plugin manager
[group('terminal')]
tmux-install:
    @brew install tmux
    @git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm || true # install a plugin manager

# Install fonts
[group('ui')]
fonts-install:
    @brew install --cask font-hack-nerd-font

# Install PostgreSQL and pgcli
[group('dev')]
postgres-install:
    @brew install postgresql
    @brew services start postgresql
    @brew install pgcli

# Install Go and its language server
[group('dev')]
go-install:
    @brew install go
    @go install golang.org/x/tools/gopls@latest

# Install Lua and its package manager
[group('dev')]
lua-install:
    @brew install lua luarocks

# Configure Git and install related tools
[group('dev')]
git-config: git-hooks-install git-czg-install

# Install Git hooks
[group('dev')]
git-hooks-install:
    @git config core.hooksPath hooks

# Install Git commit message formatter
[group('dev')]
git-czg-install:
    @brew install npm
    @npm install -g czg
    @npm list -g

# Install Neovim and dependencies
[group('nvim')]
nvim-install: telescope-dependencies-install
    @brew install nvim

# Install dependencies for Telescope, a Neovim plugin
[group('nvim')]
telescope-dependencies-install:
    @brew install fd ripgrep

# Install various utilities
[group('utils')]
util-install:
    @brew install bat colordiff eza fzf glow tokei

# Install Copilot CLI
[group('dev')]
copilot-cli-install:
    @brew install copilot-cli
