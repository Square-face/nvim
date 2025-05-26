local sur = {
    "kylechui/nvim-surround",
    name = "surround",
    keys = {
        { "ds", desc = "Delete surround" },
        { "cs", desc = "Change surround" },
        { "cS", desc = "Change surround (newline)" },
        { "ys", desc = "Create surround" },
        { "yS", desc = "Create surround (newline)" },
        { "yss", desc = "Create surround (entire line)" },
        { "ysS", desc = "Create surround (for entire line) (newline)" },
    },
    opts = {},
}

local autopairs = {
    "windwp/nvim-autopairs",
    name = "autopairs",
    event = "InsertEnter",
    opts = {},
}

return { sur, autopairs }
