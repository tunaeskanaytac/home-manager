-- vim.cmd("set expandtab") -- spaces instead of tab character
vim.cmd("set tabstop=2") -- space count
vim.cmd("set softtabstop=2") -- acts if spaces are tab characters
vim.cmd("set shiftwidth=2") -- indentation space
vim.g.mapleader = ' ' -- set leader key as space
vim.keymap.set("n", "<leader>fd", "<Cmd>Ex<CR>")
vim.cmd("command Nohi nohlsearch")
vim.opt.number = true
vim.opt.relativenumber = true

print("prefs loaded")
