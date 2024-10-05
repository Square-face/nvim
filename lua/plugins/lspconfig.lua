local handlers = {
    function(name)
        require('lspconfig')[name].setup({})
    end,

    ["lua_ls"] = require 'lsp.lua',
}

local keys = {
    { '<leader>rn', vim.lsp.buf.rename,       silent = true, noremap = true, desc = "Rename symbol." },
    { '<leader>ca', vim.lsp.buf.code_action,  silent = true, noremap = true, desc = "Use code acion." },
    { '<leader>f',  vim.lsp.buf.format,       silent = true, noremap = true, desc = "Format code." },
    { '<leader>j',  vim.diagnostic.goto_next, silent = true, noremap = true, desc = "Jump to next diagnostic." },
    { '<leader>k',  vim.diagnostic.goto_prev, silent = true, noremap = true, desc = "Jump to previous diagnostic." },
}


return {
    'neovim/nvim-lspconfig',
    keys = keys,
    lazy = false,
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        opts         = { handlers = handlers },
        dependencies = { 'williamboman/mason.nvim', opts = {} },
    }
}
