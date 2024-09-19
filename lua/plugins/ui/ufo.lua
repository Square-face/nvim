local Plugin = { 'kevinhwang91/nvim-ufo' }
Plugin.dependencies = 'kevinhwang91/promise-async'
Plugin.lazy = 'VeryLazy'
Plugin.opts = {}

Plugin.keys = {
    { 'zR', function() require('ufo').openAllFolds() end },
    { 'zM', function() require('ufo').closeAllFolds() end }
}

Plugin.init = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    require('ufo').detach()
    require('ufo').attach()
end

return Plugin
