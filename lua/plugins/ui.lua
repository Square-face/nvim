local lazy_spec = require("core.utils").lazy_spec

local ts = {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    name = "treesitter",
    build = ":TSUpdate",
    opts = {},
}

local bbq = {
    "utilyre/barbecue.nvim",
    name = "barbecue",

    keys = { "<leader>bq", noremap = true, desc = "Toggle barbecue" },

    opts = lazy_spec.opts("barbecue"),
    config = lazy_spec.conf("barbecue"),
}
local barbar = {
    "romgrk/barbar.nvim",
    lazy = false,

    init = function() vim.g.barbar_auto_setup = false end,
    config = require("core.utils").lazy_spec.conf("barbar"),
}

local dash = {
    "nvimdev/dashboard-nvim",
    name = "dashboard",

    dependencies = "folke/snacks.nvim",

    cond = vim.fn.argc() == 0,
    opts = lazy_spec.opts("dashboard"),
}

local deps = {
    -- barbar
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",

    -- barbecue
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
}

local ol = {
    "hedyhli/outline.nvim",
    name = "outline",
    opts = { outline_window = { position = "right" } },
    cmd = { "Outline", "OutlineOpen" },
    keys = {
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
}

local folds = {
    "bbjornstad/pretty-fold.nvim",
    name = "pretty-folds",
    event = { "BufNewFile", "BufRead" },
    opts = {
        sections = {
            left = {
                "content",
                function(config) return config.fill_char:rep(1) end,
                "󰁂 ",
                "number_of_folded_lines",
            },
            right = {
                "percentage",
                function(config) return config.fill_char:rep(3) end,
            },
        },

        fill_char = " ",
    },
}

local twilight = {
    "folke/twilight.nvim",
    name = "twilight",
    lazy = true,
    opts = {
        dimming = {
            alpha = 0.5,
            color = { "Normal", "#ffffff" },
            term_bg = "#000000",
            inactive = false,
        },
        context = 15,
        expand = {
            "module",
            "function",
            "method",
            "table",
            "if_statement",
        },
        exclude = { "markdown" },
    },
}

local zen = {
    "folke/zen-mode.nvim",
    name = "zen-mode",
    opts = {
        window = {
            width = 200,
            options = {
                number = false,
                cursorcolumn = false,
                foldcolumn = "0",
                list = false,
            },
        },
        plugins = {
            gitsigns = { enabled = true },
            kitty = { enabled = true, font = "+1" },
            tmux = { enabled = true },
        },
    },
    keys = {
        {
            "<leader>z",
            function() require("zen-mode").toggle() end,
            desc = "Toggle Zen mode",
        },
    },
}

return { bbq, barbar, ts, dash, ol, folds, twilight, zen, deps }
