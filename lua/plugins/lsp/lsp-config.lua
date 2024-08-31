local Plugin = {'neovim/nvim-lspconfig'}
Plugin.lazy = false
Plugin.dependencies = { 'williamboman/mason-lspconfig.nvim' }

Plugin.config = function()
    require 'lsp'
end

Plugin.init_options = {
    userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
    }
}

return Plugin
