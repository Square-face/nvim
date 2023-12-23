
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

    { -- Transparent background
        "xiyaowong/transparent.nvim",
        lazy = false,
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
                    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright", "texlab" },
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

    { -- Inlay hints
        "simrat39/rust-tools.nvim",

        lazy = false,

        ft = "rust",
        opts = {
            -- configuration options go here
            tools = {
                inlay_hints = {
                    -- automatically set inlay hints (type hints)
                    -- default: true
                    auto = true,

                    -- Only show inlay hints for the current line
                    only_current_line = false,

                    -- whether to show parameter hints with the inlay hints or not
                    -- default: true
                    show_parameter_hints = true,

                    -- prefix for parameter hints
                    -- default: "<-"
                    parameter_hints_prefix = "<- ",

                    -- prefix for all the other hints (type, chaining)
                    -- default: "=>"
                    other_hints_prefix = ": ",

                    -- whether to align to the length of the longest line in the file
                    max_len_align = false,

                    -- padding from the left if max_len_align is true
                    max_len_align_padding = 1,

                    -- whether to align to the extreme right or not
                    right_align = false,

                    -- padding from the right if right_align is true
                    right_align_padding = 7,

                    -- The color of the hints
                    highlight = "Comment",
                },
            },
            server = {
                -- standalone file support
                -- setting it to false may improve startup time
                standalone = true,
            }, -- rust-analyzer options
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
    },

    {
        "lervag/vimtex",
        cmd = { "VimtexCompile" }

    },

    {
        "andweeb/presence.nvim",
        event = "VeryLazy",
        opts = require "plugins.configs.presence",
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = {
            direction = "float",
        }
    }

})
