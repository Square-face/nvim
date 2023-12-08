
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
        lazy = false,
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
        "neovim/nvim-lspconfig",

        lazy = false,

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
        lazy = true,
        event = "InsertEnter",

        opts = function()
            return require "plugins.configs.cmp"

        end,

        config = function(_, opts)
            require("cmp").setup(opts)
        end,

        dependencies = {
            { -- auto close parenthesis
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
            { -- Snippets
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            },
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
        },
    },



    -- QOL

    { -- File explorer
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
        opts = {}
    },

    { -- File search
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        lazy = true,
        cmd = { "Telescope" },
    },

    { -- Keybind helper
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
        end,
        opts = {}
    },

    -- Other
    { -- Preview markdown files
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    }
})
