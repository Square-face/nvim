
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({


    -- UI 
    { -- Main theme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = require "plugins.configs.tokyonight",

        -- Load colorscheme
        config = function()
              vim.cmd([[colorscheme tokyonight-night]])
        end,
    },


    { -- Statusline
        "nvim-lualine/lualine.nvim",
        lazy=false,
        dependencies = { "kyazdani42/nvim-web-devicons" },
        opts = require "plugins.configs.lualine",
    },



    -- Intrepreters
    { -- Parser
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        opts = require "plugins.configs.treesitter",

    },


    { -- LSP manager
        "nvim/nvim-lspconfig",
        lazy=false,
        config = function()
            require "lsp.lspconfig"
        end,
    },


    { -- LSP installer
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = {},
    },
})
