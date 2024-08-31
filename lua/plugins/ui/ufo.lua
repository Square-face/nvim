local Plugin = { 'kevinhwang91/nvim-ufo' }
Plugin.dependencies = 'kevinhwang91/promise-async'
Plugin.opts = {}

Plugin.keys = {
    {'zR', function() require('ufo').openAllFolds() end},
    {'zM', function() require('ufo').closeAllFolds() end}
}

return Plugin
