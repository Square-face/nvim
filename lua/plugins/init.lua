-- Set leader key for keybinds
vim.g.mapleader = ' '

local extended = require 'core.utils'.extended

-- Lazy load plugins
require('lazy').setup({


    -- UI
    extended({ -- Color theme

        'folke/tokyonight.nvim',
        name = 'tokyonight',
        lazy = false,
        priority = 100,

    }, 'plugins.configs.tokyonight'),

    {
        'aserowy/tmux.nvim',
        lazy = false,
        opts = {},
    },

    {
        'alexghergh/nvim-tmux-navigation',

        keys = {
            { '<C-l>', function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end },
            { '<C-h>', function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft() end },
            { '<C-k>', function() require('nvim-tmux-navigation').NvimTmuxNavigateUp() end },
            { '<C-j>', function() require('nvim-tmux-navigation').NvimTmuxNavigateDown() end },
        }
    },


    extended({ -- Statusline

        'nvim-lualine/lualine.nvim',
        lazy = false,

    }, 'plugins.configs.lualine'),

    {
        'j-hui/fidget.nvim',
        lazy = false,
        opts = {},
    },

    extended({ -- Tabs
        'romgrk/barbar.nvim',
        lazy = false,

    }, "plugins.configs.barbar"),

    extended({ -- Hover
        'lewis6991/hover.nvim'
    }, 'plugins.configs.hover'),

    extended({
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
    }, 'plugins.configs.todo-comments'),



    -- Intrepreters

    extended({ -- Parser

        'nvim-treesitter/nvim-treesitter',
        lazy = false,

    }, 'plugins.configs.treesitter'),


    extended({ -- LSP manager
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = { 'williamboman/mason-lspconfig.nvim' },

    }, 'plugins.configs.lsp-config'),

    extended({
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
    }, 'plugins.configs.dap'),

    extended({ -- LSP installer

        'williamboman/mason.nvim',
        lazy = true,

    }, 'plugins.configs.mason'),


    extended({ -- LSP bridge

        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        dependencies = { 'williamboman/mason.nvim' },

    }, 'plugins.configs.mason-lsp'),

    { -- glsl syntax highlighting
        'tikhomirov/vim-glsl',
        lazy = true,
        ft = 'glsl'
    },

    { -- Rustaceans
        'mrcjkb/rustaceanvim',
        version = '^3',
        ft = 'rust',
    },

    {                   -- Haskell tools
        'mrcjkb/haskell-tools.nvim',
        version = '^3', -- Recommended
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    },

    extended({ -- Autocomplete
        'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
        dependencies = {
            'windwp/nvim-autopairs',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
        },
    }, 'plugins.configs.cmp'),


    extended({ -- auto close parenthesis

        lazy = true,
        'windwp/nvim-autopairs',

    }, 'plugins.configs.autopairs'),


    { -- Snippets
        'L3MON4D3/LuaSnip',
        lazy = true,
        build = vim.g.isnix and "nix-shell -p gnumake --run 'make install_jsregexp'" or "make install_jsregexp",
        dependencies = 'rafamadriz/friendly-snippets',
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
    },

    -- QOL

    { -- Better looking folds
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        opts = {},
    },


    { -- File explorer
        'nvim-tree/nvim-tree.lua',
        keys = {
            { '<C-n>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file explorer', silent = true, noremap = true }
        },
        opts = {},
    },

    { -- File search
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        cmd = { 'Telescope' },
        keys = {
            { 'ff', function() require 'telescope.builtin'.find_files() end, desc = 'Find files' },
            { 'fg', function() require 'telescope.builtin'.live_grep() end,  desc = 'Find files with grep' },
            { 'fb', function() require 'telescope.builtin'.buffers() end,    desc = 'Find buffers' },
            { 'fh', function() require 'telescope.builtin'.help_tags() end,  desc = 'Find help' },
            { 'ft', function() require 'telescope.builtin'.treesitter() end, desc = 'Find symbols (treesitter)' },
        }
    },

    extended({ -- Terminal

        'akinsho/toggleterm.nvim',
        cmd = { 'ToggleTerm', 'ToggleExec' },

    }, 'plugins.configs.toggleterm'),


    {
        'tpope/vim-surround',
        keys = { 'cs', 'ds', 'ys', 'cst', 'dsf', 'dst' },
        dependencies = { 'tpope/vim-repeat' },
    },


    { -- Keybind helper

        'folke/which-key.nvim',
        event = 'VeryLazy',

    },

    -- Other

    { -- Preview markdown files
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = vim.g.isnix and "nix-shell -p corepack nodejs --run 'pnpm up && cd app && pnpm install'" or "pnpm up && cd app && pnpm install",
        init = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_echo_preview_url = 1
        end,
        ft = { 'markdown' },
    },

    { -- Markdown presentation
        'aca/marp.nvim',
        keys = {
            { '<leader>mp', function() require('marp.nvim').ServerStart() end, desc = 'Start Marp Server' },
            { '<leader>me', function() require('marp.nvim').ServerStop() end,  desc = 'Stop Mark Server' },
        },
    },

    {

        'lervag/vimtex',
        cmd = { 'VimtexCompile' }

    },

    extended({

        'andweeb/presence.nvim',
        event = 'VeryLazy',

    }, 'plugins.configs.presence'),

    { -- Smooth scrolling
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup {}
        end
    }
})
