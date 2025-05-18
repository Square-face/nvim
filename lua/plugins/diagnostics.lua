local diagnostics = { "rachartier/tiny-inline-diagnostic.nvim", name = "inline-diagnostic" }
diagnostics.event = "LspAttach"
diagnostics.priority = 1000

diagnostics.opts = {
    preset = "modern",

    options = {
        throttle = 0,
        enable_on_insert = true,
        use_icons_from_diagnostic = true,
        multilines = { enabled = true },
        break_line = { enabled = true },
    },
}

return diagnostics
