local plug = { "catppuccin/nvim", name="catppuccin" }

plug.opts = {
    transparent_background = true,
    show_end_of_buffer = true,
    integrations = {
        which_key = true,
        notify = true,
        dashboard = true,
        illuminate = {enable = true},
    },
}

plug.init = function()
    vim.cmd.colorscheme('catppuccin')
end



return plug
