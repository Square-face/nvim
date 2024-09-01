local Plugin = { 'AlexvZyl/nordic.nvim' }
Plugin.lazy = false
Plugin.priority = 1000
Plugin.enabled = true

Plugin.opts = {
    transparent_bg = true,
    bold_keywords = true,
    cursorline = {
        bold = true,
        bold_number = true,
    }
}

Plugin.init = function()
    vim.cmd("colorscheme nordic")
    vim.api.nvim_set_hl(0, 'MsgArea', {bg='#16161e'})
    vim.api.nvim_set_hl(0, 'FoldColumn', {link='Normal'})
    vim.api.nvim_set_hl(0, 'Visual', {bg='#3b4252'})
end
return Plugin
