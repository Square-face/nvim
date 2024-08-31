local Plugin = { 'alexghergh/nvim-tmux-navigation' }

Plugin.keys = {
    { '<C-l>', function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end },
    { '<C-h>', function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft() end },
    { '<C-k>', function() require('nvim-tmux-navigation').NvimTmuxNavigateUp() end },
    { '<C-j>', function() require('nvim-tmux-navigation').NvimTmuxNavigateDown() end },
}

return Plugin
