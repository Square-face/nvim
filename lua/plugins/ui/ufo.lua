local Plugin = { 'kevinhwang91/nvim-ufo' }
Plugin.dependencies = 'kevinhwang91/promise-async'
Plugin.lazy = false
Plugin.opts = {}

Plugin.keys = {
    {'zR', function() require('ufo').openAllFolds() end},
    {'zM', function() require('ufo').closeAllFolds() end}
}

Plugin.init = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
end

return Plugin
