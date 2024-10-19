local max = require "math".max
local plug = { 'folke/which-key.nvim', name = 'which-key' }

plug.event = 'VeryLazy'

plug.opts = {
    spec = {
        { '<ESC>', '<cmd>nohlsearch<CR>',                                        mode = 'n', silent = true, noremap = true, desc = 'Hide search results', },
        { '?',     function() require("which-key").show({ global = false }) end, mode = 'n', silent = true, noremap = true, desc = 'Buffer Local Keymaps (which-key)', },
        {
            mode = { 'n', 'i' },
            { '<A-j>', function() vim.cmd('m+' .. max(1, vim.v.count)) end,     noremap = true, desc = 'Move line down' },
            { '<A-k>', function() vim.cmd('m-' .. max(2, 1 + vim.v.count)) end, noremap = true, desc = 'Move line up' },
        },
        {
            mode = { 'v' },
            { '<A-j>', function() vim.cmd('m\'>+' .. max(1, vim.v.count)) end,     noremap = true, desc = 'Move line down' },
            { '<A-k>', function() vim.cmd('m\'<-' .. max(1, 1 + vim.v.count)) end, noremap = true, desc = 'Move line up' },
        },
    }
}

return plug
