local barbar = { "romgrk/barbar.nvim" }
barbar.lazy = false

barbar.dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
}

barbar.init = function() vim.g.barbar_auto_setup = false end
barbar.config = require('core.utils').lazy_spec.conf('barbar')

return barbar
