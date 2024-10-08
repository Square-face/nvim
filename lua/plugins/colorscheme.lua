local horizon = {
    "akinsho/horizon.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        plugins = {
            telescope = true
        },
    }

}

local catppuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        show_end_of_buffer = true
    }
}

horizon.init = function()
    vim.cmd.colorscheme('horizon')
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffffff' })
end

catppuccin.init = function()
    vim.cmd.colorscheme('catppuccin')
end



return catppuccin
