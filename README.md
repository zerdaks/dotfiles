# README

This is the repository for my dotfiles. To install on macOS:

## Configure GitHub

[Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

## Install dotfiles

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git make
git clone git@github.com:zerdaks/dotfiles.git
cd dotfiles/
make
stow .
```

## Configure fish

```bash
tide configure
```

## Configure Neovim

```bash
vim
:Lazy # followed by shift-u to update all
:Mason # followed by shift-u to update all
:Copilot auth
```

## Configure tmux

> System Settings &rarr; Keyboard &rarr; Keyboard Shortcuts... &rarr; Input Sources &rarr; Select the previous input source (uncheck)

[https://stackoverflow.com/a/71337138](https://stackoverflow.com/a/71337138)

```bash
tm # followed by prefix + shift-i to install all
```
