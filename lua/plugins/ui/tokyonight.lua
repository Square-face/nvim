local Plugin = {"folke/tokyonight.nvim"}
Plugin.name = 'tokyonight'
Plugin.lazy = false
Plugin.priority = 100
Plugin.enabled = false

Plugin.opts = {
    style = "moon",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true,     -- Enable this to disable setting the background color
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
}
Plugin.init = function()
    vim.cmd("colorscheme tokyonight")
    vim.api.nvim_set_hl(0, 'MsgArea', {bg='#16161e'})
    vim.api.nvim_set_hl(0, '@lsp.type.unresolvedReference.rust', {})
end

return Plugin
