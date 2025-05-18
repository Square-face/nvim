local crates = { "saecki/crates.nvim", tag = "stable", name = "crates" }
crates.event = "BufRead Cargo.toml"
crates.opts = {
    lsp = {
        enabled = true,
        on_attach = function(_, _) end,
        actions = true,
        completion = true,
        hover = true,
    },
}

local rustacean = { "mrcjkb/rustaceanvim", version = "5.2.1" }
rustacean.ft = "rust"

return { rustacean, crates }
