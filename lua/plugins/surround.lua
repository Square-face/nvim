local plug = { "kylechui/nvim-surround", name = "surround" }
plug.version = "*"

plug.keys = {
    { "ds", desc = "Delete surround" },
    { "cs", desc = "Change surround" },
    { "cS", desc = "Change surround (newline)" },
    { "ys", desc = "Create surround" },
    { "yS", desc = "Create surround (newline)" },
    { "yss", desc = "Create surround (entire line)" },
    { "ysS", desc = "Create surround (for entire line) (newline)" },
}

plug.opts = {}

return plug
