local plug = { "utilyre/barbecue.nvim", version = "*", opts = {} }
plug.event = 'LspAttach'

plug.dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
}

return plug