#!/usr/bin/env zsh

RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')
CARE=$(printf '\033[42m')

sudo rm -rf ~/.vim_runtime
sudo rm -rf ~/.vimrc
sudo rm -rf ~/.tmux*
sudo rm -rf ~/.zsh*
sudo rm -rf ~/.oh-my-zsh
sudo apt-get remove zsh
uninstall_oh_my_zsh

echo "${CARE}Don't forget to restart your terminal! finish!!!!!${RESET}"
