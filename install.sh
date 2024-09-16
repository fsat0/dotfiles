#!/bin/bash

base=$(cd $(dirname $0); pwd)

mkdir -p ${HOME}/.config/nvim
ln -s ${base}/init.lua ${HOME}/.config/nvim/init.lua
ln -s ${base}/lua ${HOME}/.config/nvim/lua
