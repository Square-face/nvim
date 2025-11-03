vim.g.mapleader = " "
vim.g.maplocalleader = "-"

vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.winborder = "rounded"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 2
vim.o.foldtext = ""

vim.o.spell = true
vim.o.spelllang = "en"

vim.o.exrc = true

vim.o.completeopt = 'fuzzy,menuone,noselect,popup'
