# Homebrew-driven setup for these dotfiles. See README.md for the bootstrap order.
#
# Recipes are quiet by default; run `just --no-quiet <recipe>` to echo commands.
set quiet

# List available recipes
default:
    just --list

# Run every recipe
all: stow zsh brew git nvim tmux wezterm fonts util cloud go java

# Install stow and link the dotfiles into $HOME
[group('setup')]
stow:
    brew install stow
    stow -R --no-folding . # --no-folding links contents, not parent directories

# Configure Homebrew aliases
[group('setup')]
brew:
    brew alias | grep -q "clean=" || brew alias clean='cleanup && brew doctor' # `brew alias` is built in; the homebrew/aliases tap is deprecated

# Install zsh prompt and plugins
[group('shell')]
zsh:
    brew install starship zoxide zsh-autosuggestions zsh-syntax-highlighting
    brew install fzf # .zshrc sources `fzf --zsh` at startup, so it must land here

# Install tmux
[group('shell')]
tmux:
    brew install tmux

# Install WezTerm
[group('shell')]
wezterm:
    brew install --cask wezterm # configured by .wezterm.lua

# Install fonts
[group('shell')]
fonts:
    brew install --cask font-hack-nerd-font

# Install various utilities
[group('shell')]
util:
    brew install bat eza jq tokei
    brew install sevenzip # provides 7zz, used by the unzip alias in .zshrc

# Install the AWS and Kubernetes CLIs
[group('shell')]
cloud:
    brew install awscli # provides aws, used by .config/zsh/aws.zsh
    brew install kubernetes-cli # provides kubectl, used by .config/zsh/kubectl.zsh
    brew install kubectx # provides kubectx and kubens

# Configure Git and install related tools
[group('git')]
git:
    brew install czg # Conventional Commits prompt, aliased to `git cz`
    brew install gh # provides the zsh completions .zshrc picks up
    brew install gitleaks # required by hooks/pre-push
    brew install lazygit # required by lazygit.nvim and .config/lazygit
    git config core.hooksPath hooks

# Install Neovim and its external dependencies
[group('nvim')]
nvim:
    brew install neovim tree-sitter-cli
    brew install make # telescope-fzf-native and LuaSnip are compiled by nvim's PackChanged hook
    brew install ripgrep # Telescope file search and live grep
    brew install node # runs Mason's copilot-language-server
    brew install buf prettier sql-formatter # conform.nvim formatters that neither Mason nor another recipe installs

# Install Go and its formatter
[group('lang')]
go:
    brew install go goimports # goimports is used by conform.nvim

# Install a JDK for nvim-jdtls
[group('lang')]
java:
    brew install openjdk # keg-only, so .zprofile puts it on PATH
