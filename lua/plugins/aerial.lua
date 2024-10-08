local plug = {
    'stevearc/aerial.nvim',
}

plug.opts = {
    backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    lazy_load = false,
    autojump = true,
}

plug.keys = {
    { '<leader>a', '<cmd>AerialNavToggle<CR>', desc = 'Toggle aerial navigation' }
}

return plug
