
vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct

local extended = require 'core.utils'.extended



require('lazy').setup({


    -- UI 
    extended({ -- Color theme

        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,

    }, 'plugins.configs.tokyonight'),


    { -- Transparent background

        'xiyaowong/transparent.nvim',
        lazy = false,

    },


    extended({ -- Statusline

        'nvim-lualine/lualine.nvim',
        lazy = false,

    }, 'plugins.configs.lualine'),



    -- Intrepreters

    extended({ -- Parser

        'nvim-treesitter/nvim-treesitter',
        lazy = false,

    }, 'plugins.configs.treesitter'),


    extended({ -- LSP manager

        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = { 'williamboman/mason.nvim' },

    }, 'plugins.configs.lsp-config'),


    extended({ -- LSP installer

        'williamboman/mason.nvim',
        lazy = true,

    }, 'plugins.configs.mason'),


    extended({ -- LSP bridge

        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        dependencies = { 'williamboman/mason.nvim' },

    }, 'plugins.configs.mason-lsp'),


    extended({ -- Rust-tools

        'simrat39/rust-tools.nvim',
        lazy = true,
        ft = "rust",

    }, 'plugins.configs.rust-tools'),


    extended({ -- Autocomplete
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = 'InsertEnter',
        dependencies = {
            'windwp/nvim-autopairs',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
        },
    }, 'plugins.configs.cmp'),


    extended({ -- auto close parenthesis

        'windwp/nvim-autopairs',
        lazy = true,

    }, 'plugins.configs.autopairs'),


    { -- Snippets
        'L3MON4D3/LuaSnip',
        lazy = true,
        dependencies = 'rafamadriz/friendly-snippets',
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
    },



    -- QOL

    { -- File explorer
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        keys = {
            { '<C-n>', '<cmd>NvimTreeToggle<CR>', desc='Toggle file explorer', silent=true, noremap=true }
        },
        opts = {},
    },

    { -- File search
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        lazy = true,
        cmd = { 'Telescope' },
        keys = {
            { 'ff', function() require'telescope.builtin'.find_files() end, desc='Find files'},
            { 'fg', function() require'telescope.builtin'.live_grep() end, desc='Find files with grep'},
            { 'fb', function() require'telescope.builtin'.buffers() end, desc='Find buffers'},
            { 'fh', function() require'telescope.builtin'.help_tags() end, desc='Find help'},
            { 'ft', function() require'telescope.builtin'.treesitter() end, desc='Find symbols (treesitter)'},
        }
    },

    extended({ -- Terminal

        'akinsho/toggleterm.nvim',
        lazy = true,
        cmd = { "ToggleTerm", "ToggleExec" },

    }, "plugins.configs.toggleterm"),


    {
        'tpope/vim-surround',
        lazy = true,
        keys = { 'cs', 'ds', 'ys' },
        dependencies = {'tpope/vim-repeat'},
    },


    { -- Keybind helper

        "folke/which-key.nvim",
        lazy = true,
        event = "VeryLazy",

    },

    -- Other

    { -- Preview markdown files
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_start = 1
        vim.g.mkdp_open_to_the_world = 1
        vim.g.mkdp_open_ip = '0.0.0.0'
      end,
      ft = { "markdown" },
    },

    {

        "lervag/vimtex",
        lazy = true,
        cmd = { "VimtexCompile" }

    },

    extended({

        "andweeb/presence.nvim",
        lazy = true,
        event = "VeryLazy",

    }, "plugins.configs.presence"),

})
