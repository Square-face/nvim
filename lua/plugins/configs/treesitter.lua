local options = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "all" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
    },
}


return options
