local lspconfig = { 'neovim/nvim-lspconfig', name = "lspconfig", event = { 'BufReadPost', 'BufNewFile' } }
local mason = { 'williamboman/mason-lspconfig.nvim', name = "mason-lspconfig", opts = {} }
local lazydev = { "folke/lazydev.nvim", name = "lazydev", ft = "lua" }

lspconfig.config = function()
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
end

lazydev.opts = {
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

lspconfig.keys = {
    { '<leader>f',   vim.lsp.buf.format,                                 silent = true, noremap = true, desc = "Format code" },
    { '<leader>rn',  vim.lsp.buf.rename,                                 silent = true, noremap = true, desc = "Rename symbol" },
    { '<leader>ca',  vim.lsp.buf.code_action,                            silent = true, noremap = true, desc = "Use code acion" },
    { '<C-j>',       function() vim.diagnostic.jump({ count = 1 }) end,  silent = true, noremap = true, desc = "Jump to next diagnostic" },
    { '<C-k>',       function() vim.diagnostic.jump({ count = -1 }) end, silent = true, noremap = true, desc = "Jump to previous diagnostic" },
}

mason.dependencies = { 'williamboman/mason.nvim', name = "mason", opts = { PATH = 'append' } }
lspconfig.dependencies = { mason, 'rachartier/tiny-inline-diagnostic.nvim' }

return { lspconfig, lazydev  }
