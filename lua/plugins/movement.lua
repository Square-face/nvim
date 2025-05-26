local sneak = {
    "justinmk/vim-sneak",
    dependencies = "tpope/vim-repeat",
    keys = {
        { "<leader>ss", "<Plug>Sneak_s" },
        { "<leader>sS", "<Plug>Sneak_S" },
        { "<leader>sf", "<Plug>Sneak_f" },
        { "<leader>sF", "<Plug>Sneak_F" },
        { "<leader>st", "<Plug>Sneak_t" },
        { "<leader>sT", "<Plug>Sneak_T" },
    },
}

return sneak
