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
}

local keys = {
    { '<leader>rn', vim.lsp.buf.rename,       silent = true, noremap = true, desc = "Rename symbol." },
    { '<leader>ca', vim.lsp.buf.code_action,  silent = true, noremap = true, desc = "Use code acion." },
    { '<leader>f',  vim.lsp.buf.format,       silent = true, noremap = true, desc = "Format code." },
    { '<C-j>',      vim.diagnostic.goto_next, silent = true, noremap = true, desc = "Jump to next diagnostic." },
    { '<C-k>',      vim.diagnostic.goto_prev, silent = true, noremap = true, desc = "Jump to previous diagnostic." },
}

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }

local function init()
    vim.diagnostic.config({
        update_in_insert = true,
        severity_sort = true,
    })

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return {
    'neovim/nvim-lspconfig',
    keys = keys,
    lazy = false,
    init = init,
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        opts         = { handlers = handlers },
        dependencies = { 'williamboman/mason.nvim', opts = { PATH = 'append' } },
    }
}
