-- Set leader key for keybinds
vim.g.mapleader = ' '

-- Lazy load plugins
return {
    {import = "plugins.ui"},
    {import = "plugins.lsp"},

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
            { 'ff', function() require 'telescope.builtin'.find_files() end,          desc = 'Find files' },
            { 'fg', function() require 'telescope.builtin'.live_grep() end,           desc = 'Find files with grep' },
            { 'fb', function() require 'telescope.builtin'.buffers() end,             desc = 'Find buffers' },
            { 'fh', function() require 'telescope.builtin'.help_tags() end,           desc = 'Find help' },
            { 'fs', function() require 'telescope.builtin'.treesitter() end,          desc = 'Find symbols (treesitter)' },
            { 'fr', function() require 'telescope.builtin'.lsp_refrences() end,       desc = 'Find refrences (LSP)' },
            { 'fd', function() require 'telescope.builtin'.lsp_definitions() end,     desc = 'Find definitions (LSP)' },
            { 'fi', function() require 'telescope.builtin'.lsp_implementations() end, desc = 'Find implementations (LSP)' },
        }
    },

    {
        'tpope/vim-surround',
        keys = { 'cs', 'ds', 'ys', 'cst', 'dsf', 'dst' },
        dependencies = { 'tpope/vim-repeat' },
    },


    { -- Keybind helper
        'folke/which-key.nvim',
        event = 'VeryLazy',
    },

    { -- Vscode run button (but good)
        'stevearc/overseer.nvim',
        keys = {
            { '<leader>ot', ":OverseerToggle!<CR>",             desc = "Toggles Overseer window while keeping the current focus", silent = true, noremap = true },
            { '<leader>of', ":OverseerToggle<CR>",              desc = "Toggles Overseer window and moves focus to it",           silent = true, noremap = true },
            { '<leader>oo', ":OverseerQuickAction restart<CR>", desc = "Restart the last task",                                   silent = true, noremap = true },
            { '<leader>os', ":OverseerQuickAction stop<CR>",    desc = "Stop the last task",                                      silent = true, noremap = true },
            { '<leader>or', ":OverseerRun<CR>",                 desc = "Run a task",                                              silent = true, noremap = true },
        },
        opts = {
            task_list = {
                bindings = {
                    ['<C-l>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end,
                    ['<C-h>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft() end,
                    ['<C-k>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateUp() end,
                    ['<C-j>'] = function() require('nvim-tmux-navigation').NvimTmuxNavigateDown() end,
                    ["<A-l>"] = "IncreaseDetail",
                    ["<A-h>"] = "DecreaseDetail",
                    ["<A-k>"] = "ScrollOutputUp",
                    ["<A-j>"] = "ScrollOutputDown",
                },
            },
            bundles = {
                autostart_on_load = false,
            },
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rustaceanvim",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("rustaceanvim.neotest"),
                },
            })
        end,
    },

    {
        'stevearc/resession.nvim',
        dependencies = { 'stevearc/overseer.nvim' },
        opts = {
            extensions = {
                overseer = {
                    -- customize here
                },
            },
        },
        lazy = false,
        keys = {
            { "<leader>ss", function() require("resession").save() end,  desc = "Save a session" },
            { "<leader>sl", function() require("resession").load() end,  desc = "Load a session" },
            { "<leader>sd", function() require("resession").delet() end, desc = "Delete a session" },
        },
        init = function()
            local resession = require "resession"
            local function get_session_name()
                local name = vim.fn.getcwd()
                local branch = vim.trim(vim.fn.system("git branch --show-current"))
                if vim.v.shell_error == 0 then
                    return name .. branch
                else
                    return name
                end
            end
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    -- Only load the session if nvim was started with no args
                    if vim.fn.argc(-1) == 0 then
                        resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
                    end

                    -- required bcs overseer doesn't properly load tasks if autoload is false
                    require("overseer").new_task({ cmd = { "ls" } }):dispose()
                end,
            })
            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    -- close overseer before saving as it has a tendency of applying keybinds correctly if opened imediatelly
                    require("overseer").close()
                    resession.save(get_session_name(), { dir = "dirsession", notify = false })
                end,
            })
        end
    },

    -- Other

    { -- Preview markdown files
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = vim.g.isnix and "nix-shell -p corepack nodejs --run 'pnpm up && cd app && pnpm install'" or
            "pnpm up && cd app && pnpm install",
        init = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_echo_preview_url = 1
        end,
        ft = { 'markdown' },
    },

    {
        'lervag/vimtex',
        cmd = { 'VimtexCompile' }
    },

    { -- Smooth scrolling
        "karb94/neoscroll.nvim",
        opts = {},
    }
}
