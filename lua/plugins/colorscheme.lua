local plug = { "catppuccin/nvim" }

plug.opts = {
    show_end_of_buffer = true,
    integrations = {
        which_key = true,
    },
}

plug.init = function()
    vim.cmd.colorscheme('catppuccin')
end



return plug
