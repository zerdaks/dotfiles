# README

This is the repository for my dotfiles. To install on macOS:

## Configure GitHub

[Generating a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)

```bash
ssh-keygen -t ed25519 -C 'your_email@example.com' -N '' -f ~/.ssh/id_ed25519
```

[Adding your SSH key to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)

```bash
echo -e 'Host github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519' >> ~/.ssh/config
```

[Adding a new SSH key to your account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account)

```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

## Install Git and dotfiles

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
git clone git@github.com:zerdaks/dotfiles.git
```

## Install software

```bash
cd dotfiles/
make
stow .
```

## Configure fish

```bash
tide configure
```

## Install Neovim plugins

```bash
nvim

:Lazy # followed by shift-u to update all

:TSUpdate
:TSInstallInfo

:Mason # followed by shift-u to update all

:Copilot setup
```

## Install tmux plugins

> System Settings &rarr; Keyboard &rarr; Keyboard Shortcuts... &rarr; Input Sources &rarr; Select the previous input source (uncheck)

[https://stackoverflow.com/a/71337138](https://stackoverflow.com/a/71337138)

```bash
tm # followed by prefix + shift-i to install all
```
