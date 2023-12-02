
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = require "plugins.configs.tokyonight",

        -- Load colorscheme
        config = function()
              vim.cmd([[colorscheme tokyonight-night]])
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
        opts = require "plugins.configs.lualine",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        opts = require "plugins.configs.treesitter",

    }
})
