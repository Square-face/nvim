local Plugin = { 'stevearc/overseer.nvim' }

Plugin.opts = {
    task_list = {
        bindings = {
            ['<C-l>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end,
            ['<C-h>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft() end,
            ['<C-k>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateUp() end,
            ['<C-j>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateDown() end,
            ["<A-l>"] = "IncreaseDetail",
            ["<A-h>"] = "DecreaseDetail",
            ["<A-k>"] = "ScrollOutputUp",
            ["<A-j>"] = "ScrollOutputDown",
        },
    },
    bundles = {
        autostart_on_load = false,
    },
}

Plugin.keys = {
    { '<leader>ot', ":OverseerToggle!<CR>",             desc = "Toggles Overseer window while keeping the current focus", silent = true, noremap = true },
    { '<leader>of', ":OverseerToggle<CR>",              desc = "Toggles Overseer window and moves focus to it",           silent = true, noremap = true },
    { '<leader>oo', ":OverseerQuickAction restart<CR>", desc = "Restart the last task",                                   silent = true, noremap = true },
    { '<leader>os', ":OverseerQuickAction stop<CR>",    desc = "Stop the last task",                                      silent = true, noremap = true },
    { '<leader>or', ":OverseerRun<CR>",                 desc = "Run a task",                                              silent = true, noremap = true },
}


return Plugin
