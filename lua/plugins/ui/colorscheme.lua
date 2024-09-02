-- local function tokyoinit()
--     vim.api.nvim_set_hl(0, 'MsgArea', { bg = '#16161e' })
--     vim.api.nvim_set_hl(0, '@lsp.type.unresolvedReference.rust', {})
-- end
--
--
-- local function nordicinit()
--     vim.api.nvim_set_hl(0, 'MsgArea', { bg = '#16161e' })
--     vim.api.nvim_set_hl(0, 'FoldColumn', { link = 'Normal' })
--     vim.api.nvim_set_hl(0, 'Visual', { bg = '#3b4252' })
-- end

vim.cmd("colorscheme retrobox")
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function() end
-- })

return {
    {
        "folke/tokyonight.nvim",
        name = 'tokyonight',
        opts = {
            style = "moon",
            transparent = true,
            sidebars = { "qf", "help" },
            hide_inactive_statusline = false,
        },
    },
    {
        'AlexvZyl/nordic.nvim',
        opts = {
            transparent_bg = true,
            bold_keywords = true,
            cursorline = {
                bold = true,
                bold_number = true,
            }
        },
    }
}
