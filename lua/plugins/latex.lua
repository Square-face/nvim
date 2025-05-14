return {
    {
        "lervag/vimtex",
        ft = "tex",
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        "let-def/texpresso.vim",
        name = "texpresso",
        cond = function() -- ensure the binary exists
            return vim.fn.executable("texpresso") == 1
        end,
        ft = "tex",
        config = function()     -- optional: customize path
            require("texpresso").texpresso_path = vim.fn.exepath("texpresso")
        end,
    }
}
