local Plugin = { 'williamboman/mason-lspconfig.nvim' }
Plugin.lazy = true
Plugin.dependencies = { {
    'williamboman/mason.nvim',
    opts = { PATH = 'append' }
} }


Plugin.config = function() end

return Plugin
