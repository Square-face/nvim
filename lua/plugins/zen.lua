local twilight = { "folke/twilight.nvim", name = 'twilight' }

twilight.opts = {
    dimming = {
        alpha = 0.5,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
    },
    context = 15,
    expand = {
        "module",
        "function",
        "method",
        "table",
        "if_statement",
    },
}

local zen = { "folke/zen-mode.nvim", name = "zen-mode" }
zen.dependencies = { twilight }

zen.opts = {
    window = {
        width = 200,
        options = {
            number = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false
        }
    },
    plugins = {
        gitsigns = { enabled = true },
        kitty = { enabled = true, font = "+1" },
        tmux = { enabled = true }
    }
}

zen.keys = {
    { '<leader>z', function() require('zen-mode').toggle() end, desc = "Toggle Zen mode" }
}

return zen
