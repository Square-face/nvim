local lazy_spec = require("core.utils").lazy_spec

local lspconfig = { "neovim/nvim-lspconfig", name = "lspconfig", event = { "BufReadPost", "BufNewFile" } }
local mason = { "williamboman/mason.nvim", name = "mason", lazy = true }
local lazydev = { "folke/lazydev.nvim", name = "lazydev", ft = "lua" }

lspconfig.dependencies = { "rachartier/tiny-inline-diagnostic.nvim", "williamboman/mason.nvim" }
lspconfig.config = lazy_spec.conf("lspconfig")

mason.opts = lazy_spec.opts("mason")
mason.config = lazy_spec.conf("mason")

lazydev.opts = {
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

return { lspconfig, lazydev, mason }
