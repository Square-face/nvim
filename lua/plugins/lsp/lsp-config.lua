local Plugin = {'neovim/nvim-lspconfig'}
Plugin.lazy = false
Plugin.dependencies = { 'williamboman/mason-lspconfig.nvim' }

Plugin.config = function()
    require 'lsp'
end

return Plugin
