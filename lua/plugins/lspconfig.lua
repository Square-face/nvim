local handlers = {
    function (server_name)
        require('lspconfig')[server_name].setup({})
    end,

    ["lua_ls"] = require 'lsp.lua',
}



return {'neovim/nvim-lspconfig', dependencies = {
    'williamboman/mason-lspconfig.nvim', opts = {handlers = handlers},
    dependencies  = {'williamboman/mason.nvim', opts = {}},
}}
