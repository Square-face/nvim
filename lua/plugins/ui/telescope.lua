local Plugin = { 'nvim-telescope/telescope.nvim' }
Plugin.tag = '0.1.8'
Plugin.dependencies = 'nvim-lua/plenary.nvim'
Plugin.keys = {
    { 'ff', function() require('telescope.builtin').find_files() end,          desc = 'Find files' },
    { 'fg', function() require('telescope.builtin').live_grep() end,           desc = 'Find files with grep' },
    { 'fb', function() require('telescope.builtin').buffers() end,             desc = 'Find buffers' },
    { 'fh', function() require('telescope.builtin').help_tags() end,           desc = 'Find help' },
    { 'fs', function() require('telescope.builtin').treesitter() end,          desc = 'Find symbols (treesitter)' },
    { 'fr', function() require('telescope.builtin').lsp_refrences() end,       desc = 'Find refrences (LSP)' },
    { 'fd', function() require('telescope.builtin').lsp_definitions() end,     desc = 'Find definitions (LSP)' },
    { 'fi', function() require('telescope.builtin').lsp_implementations() end, desc = 'Find implementations (LSP)' },
}
return Plugin
