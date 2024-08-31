-- Keymaps
local M = {}
vim.g.mapleader = ' '

M.v = {
    ['<'] = { '<gv', 'Unindent selected lines' },
    ['>'] = { '>gv', 'Unindent selected lines' },
}

M.n = {
    -- Move text
    ['<A-j>'] = { ':m+1 <CR>', 'Move line down' },
    ['<A-k>'] = { ':m-2 <CR>', 'Move line up' },

    -- File
    ['<C-s>'] = { ':w<CR>', 'Save current file' },
    ['<Esc>'] = { ':noh<CR>', 'Remove search highlight' },

    -- Buffers
    ['<A-+>'] = { ':enew<CR>', 'Open a new buffer' },
}

M.t = {
    ['<Esc>'] = { '<C-\\><C-n>', 'Exit terminal mode' },
}


return M
