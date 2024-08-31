return {
    { 'j-hui/fidget.nvim',                   event = "VeryLazy",         opts = { integration = { ["nvim-tree"] = { enable = false } } } }, -- Very unclear what this integration does except make the startup take 30 extra ms
    { 'folke/which-key.nvim',                event = 'VeryLazy' },
    { "karb94/neoscroll.nvim",               opts = {},                  keys = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', } },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",               opts = {} },
    { "luukvbaal/statuscol.nvim",            opts = { relculright = true } },
}
