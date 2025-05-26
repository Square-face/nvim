local crates = {
    "saecki/crates.nvim",
    tag = "stable",
    name = "crates",
    event = "BufRead Cargo.toml",
    opts = {
        lsp = {
            enabled = true,
            on_attach = function(_, _) end,
            actions = true,
            completion = true,
            hover = true,
        },
    },
}

local rustacean = {
    "mrcjkb/rustaceanvim",
    ft = "rust",
    version = "^6",
}

return { rustacean, crates }
