local barbar = { "romgrk/barbar.nvim" }
barbar.lazy = false

barbar.dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
}

barbar.init = function() vim.g.barbar_auto_setup = false end
barbar.opts = {}

barbar.keys = {
    { "<A-.>", "<Cmd>BufferNext<CR>", silent = true, desc = "Switch to next tab" },
    { "<A-,>", "<Cmd>BufferPrevious<CR>", silent = true, desc = "Switch to previous tab" },

    { "<A-<>", "<Cmd>BufferMovePrevious<CR>", silent = true, desc = "Move tab left" },
    { "<A->>", "<Cmd>BufferMoveNext<CR>", silent = true, desc = "Move tab right" },

    { "<A-1>", "<Cmd>BufferGoto 1<CR>", silent = true, desc = "Go to tab 1" },
    { "<A-2>", "<Cmd>BufferGoto 2<CR>", silent = true, desc = "Go to tab 2" },
    { "<A-3>", "<Cmd>BufferGoto 3<CR>", silent = true, desc = "Go to tab 3" },
    { "<A-4>", "<Cmd>BufferGoto 4<CR>", silent = true, desc = "Go to tab 4" },
    { "<A-5>", "<Cmd>BufferGoto 5<CR>", silent = true, desc = "Go to tab 5" },
    { "<A-6>", "<Cmd>BufferGoto 6<CR>", silent = true, desc = "Go to tab 6" },
    { "<A-7>", "<Cmd>BufferGoto 7<CR>", silent = true, desc = "Go to tab 7" },
    { "<A-8>", "<Cmd>BufferGoto 8<CR>", silent = true, desc = "Go to tab 8" },
    { "<A-9>", "<Cmd>BufferGoto 9<CR>", silent = true, desc = "Go to tab 9" },

    { "<A-0>", "<Cmd>BufferLast<CR>", silent = true, desc = "Go to last tab" },

    { "<A-p>", "<Cmd>BufferPin<CR>", silent = true, desc = "Pin current tab" },

    { "<A-->", "<Cmd>BufferClose<CR>", silent = true, desc = "Close buffer" },
}

return barbar
