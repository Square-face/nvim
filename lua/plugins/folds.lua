local folds = { "bbjornstad/pretty-fold.nvim" }
folds.name = "pretty-folds"
folds.event = { "BufNewFile", "BufRead" }

folds.opts = {
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
}

return folds
