local Plugin = {"folke/tokyonight.nvim"}
Plugin.name = 'tokyonight'
Plugin.lazy = false
Plugin.priority = 100

Plugin.opts = {
    style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true,     -- Enable this to disable setting the background color
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
}

Plugin.config = function(_, opts)
    require('tokyonight').setup(opts)

    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
            vim.api.nvim_set_hl(0, '@lsp.type.unresolvedReference.rust', {})
        end
    })

    vim.cmd [[colorscheme tokyonight-night]]
    vim.cmd [[hi MsgArea guibg=#16161e]]
end

return Plugin
