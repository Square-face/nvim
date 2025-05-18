local plug = { "folke/which-key.nvim", name = "which-key" }

plug.event = "VeryLazy"

plug.opts = {
    spec = {
        {
            mode = { "v" },
            { "<", "<gv", noremap = true, desc = "Unindent line" },
            { ">", ">gv", noremap = true, desc = "Unindent line" },
        },
        {
            mode = { "n", "v" },
            {
                "<leader>rf",
                require("core.random_float").insert_random_float,
                noremap = true,
                desc = "Generate a random float value between 0 and 100",
            },
        },
        {
            mode = { "t" },
            { "<esc>", "<C-\\><C-n>", silent = true, noremap = true, desc = "Exit insert mode" },
        },
    },
}

return plug
