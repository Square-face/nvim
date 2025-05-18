local lspc = {}

lspc.config = function()
    local signs = {
        [vim.diagnostic.severity.ERROR] = "󰅚",
        [vim.diagnostic.severity.WARN] = "󰀪",
        [vim.diagnostic.severity.HINT] = "󰌶",
        [vim.diagnostic.severity.INFO] = ""
    }
    vim.diagnostic.config({
        update_in_insert = true,
        severity_sort = true,
        signs = {
            text = signs
        }
    })

    require 'lsp.harper'

    local wk = require('which-key')

    wk.add({
        { '<leader>fc', vim.lsp.buf.format,                                 silent = true, noremap = true, desc = "Format code" },
        { '<leader>rn', vim.lsp.buf.rename,                                 silent = true, noremap = true, desc = "Rename symbol" },
        { '<leader>ca', vim.lsp.buf.code_action,                            silent = true, noremap = true, desc = "Use code acion" },
        { '<C-j>',      function() vim.diagnostic.jump({ count = 1 }) end,  silent = true, noremap = true, desc = "Jump to next diagnostic" },
        { '<C-k>',      function() vim.diagnostic.jump({ count = -1 }) end, silent = true, noremap = true, desc = "Jump to previous diagnostic" },
    })
end
return lspc
