
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
            require "lsp"
        end,

        dependencies = {
            { -- LSP Installer
                "williamboman/mason-lspconfig.nvim",
                cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },

                opts = {
                    ensure_installed = { "lua_ls", "rust_analyzer"  },
                    automatic_installation = true,
                },

                dependencies = {
                    { -- LSP installer
                        "williamboman/mason.nvim",
                        opts = require "plugins.configs.mason",
                    },
                },
            },
        }
    },



    { -- Autocomplete
        "hrsh7th/nvim-cmp",
        lazy = false,
        opts = require "plugins.configs.cmp",
        dependecies = {
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                require("nvim-autopairs").setup(opts)

                -- setup cmp for autopairs
                local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
              },
            { 
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
            },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
        end,
        opts = {}
    },
})
