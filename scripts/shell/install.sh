#!/bin/sh

echo "Installing zsh, tmux and fzf..."

dotfiles=${1:-${HOME}/dotfiles}

sudo apt-get install zsh tmux

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc ~/.tmux.conf

ln -s -t ~/ "$dotfiles/shell/.zshrc"
ln -s -t ~/ "$dotfiles/shell/.tmux.conf"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --xdg --key-bindings --completion --no-update-rc