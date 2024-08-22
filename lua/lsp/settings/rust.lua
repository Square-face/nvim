local options = {
    settings = {
        -- rust-analyzer language server configuration
        ['rust-analyzer'] = {
            cargo = {
                features = "all"
            },
            diagnostics = {
                disabled = {
                    'inactive-code'
                }
            },
            check = {
                command = "clippy"
            },
            -- Other Settings ...
            procMacro = {
                ignored = {
                    leptos_macro = {
                        -- optional: --
                        "component",
                        "server",
                    },
                },
            },
        },
    },
}
return options

