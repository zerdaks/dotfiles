# Configure Homebrew aliases
brew:
    @brew tap homebrew/aliases
    @brew alias clean='cleanup && brew doctor'

# Install zsh prompt, plugins, and version managers
zsh:
    @brew install starship zoxide zsh-autosuggestions zsh-syntax-highlighting
    @brew install fnm rbenv # Node and Ruby version managers, initialized in .zshrc

# Install stow
# Use --no-folding so Stow links contents, not parent directories.
stow:
    @brew install stow
    @stow -R --no-folding .

# Install tmux and plugin manager
tmux:
    @brew install tmux
    @git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm || true # install a plugin manager

# Install fonts
fonts:
    @brew install --cask font-hack-nerd-font

# Install PostgreSQL and pgcli
postgres:
    @brew install postgresql@18
    @brew services start postgresql@18
    @brew install pgcli

# Install Go
go:
    @brew install go

# Install Lua and its package manager
lua:
    @brew install lua luarocks lua-language-server stylua

# Configure Git and install related tools
[group('git')]
git: commitizen
    @brew install gitleaks # required by hooks/pre-push
    @brew install lazygit # required by lazygit.nvim and .config/lazygit
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
nvim: telescope formatters
    @brew install nvim tree-sitter-cli

# Install dependencies for Telescope, a Neovim plugin
[group('nvim')]
telescope:
    @brew install fd ripgrep

# Install formatters used by conform.nvim, a Neovim plugin
[group('nvim')]
formatters:
    @brew install buf prettier shfmt sql-formatter # the rest come from the lua and go recipes

# Install various utilities
util:
    @brew install bat colordiff eza fzf jq tokei
