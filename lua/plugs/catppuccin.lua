return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        -- Disable any integrations
        default_integrations = false,
        custom_highlights = function(colors)
            return{
                LineNr = {fg=colors.subtext1},
                LineNrAbove = {fg = colors.overlay0},
                LineNrBelow = {fg = colors.overlay0}
            }
        end
    },
    config = function(_, opts)
        -- configure and set colorscheme
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
