
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000, -- Load first
        options = require "plugins.configs.gruvbox",

        -- Loading colorscheme
        config = function()
              vim.cmd([[colorscheme gruvbox]])
        end,
    },

    "folke/which-key.nvim",
    { "nvim/nvim-lspconfig", lazy=false },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
})


-- Load plugin configs
