return {
    'stevearc/oil.nvim',
    name = "oil",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } }, -- icons
    keys = {
        {"<leader>o", function() require('oil').open() end},
        {"<leader>O", function() require('oil').open_float() end}
    },
}
