#!/bin/bash

base=$(cd $(dirname $0); pwd)

mkdir -p ${HOME}/.config/nvim
ln -s ${base}/init.lua ${HOME}/.config/nvim/init.lua
ln -s ${base}/lua ${HOME}/.config/nvim/lua

ln -s ${base}/.gitconfig  ${HOME}/.gitconfig
ln -s ${base}/.zshrc ${HOME}/.zshrc

echo "[$(date)] install git-prompt"
if [ ! -e  ~/.zsh/prompt/git-prompt.sh ]; then
  mkdir -p ~/.zsh/prompt/
  cd ~/.zsh/prompt/ && wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/gitfast/git-prompt.sh 
  cd $BASEDIR
fi


