return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        -- Disable any integrations
        default_integrations = false,
        -- Setup some custom colors
        custom_highlights = function(colors)
            return {
                -- Transparent statusline
                StatusLine = {bg = "NONE"}
            }
        end
    },
    config = function(_, opts)
        -- configure and set colorscheme
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
