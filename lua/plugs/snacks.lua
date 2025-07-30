return {
    "folke/snacks.nvim",
    name = "snacks",
    lazy = false,
    ---@type snacks.Config
    opts = {
        picker = {},
        statuscolumn = {
            folds = {
                open = true
            }
        },
        scroll = {
            animate = {
                duration = { step = 5, total = 60 },
            }
        },
    },
    -- Keybinds
    keys = {
        -- Picker
        { "<leader><space>", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
        { "<leader>sf",      function() Snacks.picker.files() end,   desc = "Find Files" },
        { "<leader>sb",      function() Snacks.picker.buffers() end, desc = "Find Open Buffers" },
        { "<leader>sg",      function() Snacks.picker.grep() end,    desc = "Live Grep" },
        { "<leader>sh",      function() Snacks.picker.help() end,    desc = "Find Help" },
    }
}
