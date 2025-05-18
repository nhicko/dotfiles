#!/usr/bin/env bash

echo 'Cleaning dotfiles directory'
rm -rf ~/dotfiles/nvim ~/dotfiles/hypr
cp -r ~/.config/nvim ~/dotfiles/nvim
cp -r ~/.config/hypr ~/dotfiles/hypr
