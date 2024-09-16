-- vim options
vim.o.mouse = ""
vim.o.number = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.encoding = "utf-8"
vim.shiftwidth = 2
vim.g.mapleader = " "
vim.keymap.set("n", "c", "<Nop>", { noremap = true })

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
