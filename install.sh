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
    ln -sf $dotfiles/$config $configDir
done

scripts=$(ls ${dotfiles}/scripts)
for script in $scripts; do
    echo "$script: finding..."
    [ -f "${dotfiles}/scripts/${script}/install.sh" ] && sh -c ${dotfiles}/scripts/${script}/install.sh $dotfiles
done

