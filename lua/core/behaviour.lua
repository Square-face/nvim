-- Set tabs to be represented as spaces
vim.o.tabstop = 4      -- Number of spaces tabs count for
vim.o.shiftwidth = 4   -- Number of spaces used for autoindent
vim.o.expandtab = true -- Convert tabs to spaces

-- Additional settings for indentation
vim.o.autoindent = true         -- Enable autoindentation based on previous line
vim.o.smartindent = true        -- Smart autoindentation

vim.o.number = true             -- enable line numbers
vim.o.relativenumber = true     -- enable relative line numbers
vim.o.cursorline = true
vim.o.cursorlineopt="number"
vim.o.termguicolors = true
vim.o.linebreak = true
vim.o.wrap = false

vim.o.signcolumn = 'no'         -- Always show the signcolumn, to avoid shifting numbers when using Vim's default 'auto' setting
vim.o.scrolloff = 3             -- Number of lines to keep above and below the cursor

vim.o.clipboard = 'unnamedplus' -- Syncs the neovim clipboard with system clipboard

