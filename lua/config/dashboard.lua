local dash = {}
dash.opts = {
    theme = "hyper",
    disable_move = true,
    preview = {
        command = "cat | sed '$d' | awk 'NF'",
        file_path = vim.fn.stdpath("config") .. "/assets/skrattgås.ansi",
        file_width = 64,
        file_height = 30,
    },
    config = {
        header = {},
        footer = {},
        shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
                icon = "󰱼 ",
                icon_hl = "@variable",
                desc = "Files",
                group = "Label",
                action = "lua Snacks.picker.files()",
                key = "f",
            },
            {
                desc = "󱎸 Grep",
                group = "DiagnosticHint",
                action = "lua Snacks.picker.grep()",
                key = "g",
            },
        },
    },
}

return dash
