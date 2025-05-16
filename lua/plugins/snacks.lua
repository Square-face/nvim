local snacks = { 'folke/snacks.nvim' }
snacks.name = 'snacks'

snacks.opts = {
    input = {
        icon = "",
        icon_hl = "SnacksInputIcon",
        icon_pos = "left",
        prompt_pos = "title",
        win = { style = "input", border = "bottom" },
        expand = true,
    },
}

return snacks
