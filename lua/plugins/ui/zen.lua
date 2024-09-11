local Plugin = { "folke/zen-mode.nvim" }
Plugin.keys = {
    { '<leader>z', function() require("zen-mode").toggle() end }
}

Plugin.opts = {
    window = {
        width = 1.
    },
    plugins = {
        tmux = { enabled = true },
        options = {
            laststatus = 0,
        },
    }
}

return Plugin
