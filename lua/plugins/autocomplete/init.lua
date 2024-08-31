return {
    { -- Snippets
        'L3MON4D3/LuaSnip',
        lazy = true,
        build = vim.g.isnix and "nix-shell -p gnumake --run 'make install_jsregexp'" or "make install_jsregexp",
        dependencies = 'rafamadriz/friendly-snippets',
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
    },
}
