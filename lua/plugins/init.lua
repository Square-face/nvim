
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000, -- Load first
        opts = require "plugins.configs.gruvbox",

        -- Loading colorscheme
        config = function()
              vim.cmd([[colorscheme gruvbox]])
        end,
    },

    "folke/which-key.nvim",
    { "nvim/nvim-lspconfig", lazy=false },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        "nvim-lualine/lualine.nvim",
        lazy=false,
        dependencies = { "kyazdani42/nvim-web-devicons" },
        opts = { 
            options = {
                theme = 'gruvbox', -- Replace with the desired theme
                icons_enabled = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {}
        },
    }
})


-- Load plugin configs
