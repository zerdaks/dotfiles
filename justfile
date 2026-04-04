# Configure Homebrew aliases
brew:
    @brew tap homebrew/aliases
    @brew alias clean='cleanup && brew doctor'

# Install fish shell and plugins
fish:
    @brew install fish
    @fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher" # install a plugin manager
    @fish -c "fisher install IlanCosman/tide@v5" # install a fish prompt
    @fish -c "fisher install jethrokuan/z" # install directory jumping
    @fish -c "fisher list" # show installed plugins
    @fish -c 'tide configure'
    @fish -c 'fish_config' || true

# Install stow
stow:
    @brew install stow
    @stow .

# Install tmux and plugin manager
tmux:
    @brew install tmux
    @git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm || true # install a plugin manager

# Install fonts
fonts:
    @brew install --cask font-hack-nerd-font

# Install PostgreSQL and pgcli
postgres:
    @brew install postgresql
    @brew services start postgresql
    @brew install pgcli

# Install Go and its language server
go:
    @brew install go
    @go install golang.org/x/tools/gopls@latest

# Install Lua and its package manager
lua:
    @brew install lua luarocks lua-language-server

# Configure Git and install related tools
[group('git')]
git: commitizen
    @git config core.hooksPath hooks

# Install Git commit message formatter
[group('git')]
commitizen:
    @brew install npm
    @npm install -g czg
    @npm list -g

# Install Copilot CLI
copilot:
    @brew install copilot-cli

# Install Neovim and dependencies
[group('nvim')]
nvim: telescope
    @brew install nvim tree-sitter-cli

# Install dependencies for Telescope, a Neovim plugin
[group('nvim')]
telescope:
    @brew install fd ripgrep

# Install various utilities
util:
    @brew install bat colordiff eza fzf glow tokei
