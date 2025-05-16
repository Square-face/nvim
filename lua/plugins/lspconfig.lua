local lspconfig = { 'neovim/nvim-lspconfig', name = "lspconfig", lazy = false }
local mason = { 'williamboman/mason-lspconfig.nvim', name = "mason-lspconfig" }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

mason.opts = {
    handlers = {
        function(name)
            require('lspconfig')[name].setup({
                capabilities = capabilities
            })
        end,

        ["harper_ls"] = require 'lsp.harper',
    }
}

lspconfig.init = function()
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
end

lspconfig.keys = {
    { '<leader>rn',  vim.lsp.buf.rename,                                 silent = true, noremap = true, desc = "Rename symbol" },
    { '<leader>ca',  vim.lsp.buf.code_action,                            silent = true, noremap = true, desc = "Use code acion" },
    { '<leader>gd',  vim.lsp.buf.definition,                             silent = true, noremap = true, desc = "Goto definition" },
    { '<leader>gtd', vim.lsp.buf.type_definition,                        silent = true, noremap = true, desc = "Goto type definition" },
    { '<leader>f',   vim.lsp.buf.format,                                 silent = true, noremap = true, desc = "Format code" },
    { '<C-j>',       function() vim.diagnostic.jump({ count = 1 }) end,  silent = true, noremap = true, desc = "Jump to next diagnostic" },
    { '<C-k>',       function() vim.diagnostic.jump({ count = -1 }) end, silent = true, noremap = true, desc = "Jump to previous diagnostic" },
}

mason.dependencies = { 'williamboman/mason.nvim', name = "mason", opts = { PATH = 'append' } }
lspconfig.dependencies = { mason }

return lspconfig
