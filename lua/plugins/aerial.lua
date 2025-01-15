local plug = { 'stevearc/aerial.nvim', name = 'aerial' }
plug.event = { "BufReadPost", "BufWritePost", "BufNewFile" }

plug.dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
}

plug.opts = {
    backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    lazy_load = false,
    autojump = true,
    filter_kind = false,
    close_on_select = true,

    keymaps = {
        ['<ESC>'] = 'actions.close',
    },
    nav = {
        autojump = true,
        keymaps = {
            ['<ESC>'] = 'actions.close',
            ['q'] = 'actions.close',
        }
    },
    lsp = {
        diagnostics_trigger_update = true,
    }
}

plug.keys = {
    {
        '<leader>a',
        function()
            vim.cmd.AerialOpen()
        end,
        desc = 'Toggle aerial window'
    },
    {
        '<leader>n',
        function()
            vim.cmd.AerialNavToggle()
        end,
        desc = 'Toggle aerial navigation'
    },
}

return plug
