local lazydev = { "folke/lazydev.nvim", name = "lazydev", ft = "lua" }

lazydev.opts = {
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

return lazydev
