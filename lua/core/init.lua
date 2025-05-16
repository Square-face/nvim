vim.g.mapleader = ' '

-- filetypes
vim.g.tex_flavor = "latex"

-- wrap
vim.opt.wrap = true
vim.opt.textwidth = 80

-- tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'number'
vim.o.clipboard = 'unnamedplus'

-- Folds
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = '1'
vim.o.foldenable = true
vim.o.fillchars = 'foldopen:▾,foldsep:│,foldclose:▸'
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
