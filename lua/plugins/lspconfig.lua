local plug = {'neovim/nvim-lspconfig'}

plug.dependencies = {
    {'williamboman/mason.nvim', opts = {}},
    'williamboman/mason-lspconfig.nvim'
}

plug.init = function()
    local lsp = require "lspconfig"

    lsp.rust_analyzer.setup{}
    lsp.lua_ls.setup(require 'lsp.lua')
end

return plug
