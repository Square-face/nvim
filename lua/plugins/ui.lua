local lazy_spec = require('core.utils').lazy_spec

local bbq = {
    "utilyre/barbecue.nvim",
    name = 'barbecue',

    dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
    keys = { '<leader>bq', noremap = true, desc = "Toggle barbecue" },

    opts = lazy_spec.opts('barbecue'),
    config = lazy_spec.conf('barbecue'),
}

return bbq
