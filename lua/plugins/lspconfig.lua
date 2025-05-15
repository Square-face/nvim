local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local handlers = {
    function(name)
        require('lspconfig')[name].setup({
            capabilities = capabilities
        })
    end,

    ["lua_ls"] = require 'lsp.lua',
    ["harper_ls"] = require 'lsp.harper',
}

local keys = {
    { '<leader>rn',  vim.lsp.buf.rename,          silent = true, noremap = true, desc = "Rename symbol" },
    { '<leader>ca',  vim.lsp.buf.code_action,     silent = true, noremap = true, desc = "Use code acion" },
    { '<leader>gd',  vim.lsp.buf.definition,      silent = true, noremap = true, desc = "Goto definition" },
    { '<leader>gtd', vim.lsp.buf.type_definition, silent = true, noremap = true, desc = "Goto type definition" },
    { '<leader>f',   vim.lsp.buf.format,          silent = true, noremap = true, desc = "Format code" },
    { '<C-j>',       vim.diagnostic.goto_next,    silent = true, noremap = true, desc = "Jump to next diagnostic" },
    { '<C-k>',       vim.diagnostic.goto_prev,    silent = true, noremap = true, desc = "Jump to previous diagnostic" },
}


local function init()
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

return {
    'neovim/nvim-lspconfig',
    name = "lspconfig",
    keys = keys,
    lazy = false,
    init = init,
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        name         = "mason-lspconfig",
        opts         = { handlers = handlers },
        dependencies = { 'williamboman/mason.nvim', name = "mason", opts = { PATH = 'append' } },
    }
}
