#!/bin/bash

dotfiles=$(dirname "$0")
configDir=${XDG_CONFIG_HOME:-${HOME}/.config}

configs=(
    nvim
    alacritty
)

echo "dotfiles: $dotfiles"
echo "configDir: $configDir"

for config in $configs; do
    ln -s $dotfiles/$config $configDir
done

scripts=$(ls ${dotfiles}/scripts)
for script in $scripts; do
    [ -f "${script}/install.sh" ] && ${script}/install.sh
done

