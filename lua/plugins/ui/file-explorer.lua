local Plugin = { 'nvim-tree/nvim-tree.lua' }
Plugin.opts = {}
Plugin.keys = {
    { '<C-n>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file explorer', silent = true, noremap = true }
}
return Plugin
