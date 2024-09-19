vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.cmd('highlight clear FoldColumn')
    end
})

return {
    {
        "folke/tokyonight.nvim",
        name = 'tokyonight',
        lazy = true,
        opts = {
            style = "moon",
            transparent = true,
            sidebars = { "qf", "help" },
            hide_inactive_statusline = false,
        },
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = true,
        opts = {
            transparent_bg = true,
            bold_keywords = true,
            cursorline = {
                bold = true,
                bold_number = true,
            }
        },
    },
    { 'nordtheme/vim', lazy = true },
    {
        'navarasu/onedark.nvim',
        opts = {
            style = 'darker',
            highlights = {
                MatchParen = { fg = "$red", bg = "transparent" }
            },
        },
        config = function(_, opts)
            require('onedark').setup(opts)
            require('onedark').load()
        end
    }
}
