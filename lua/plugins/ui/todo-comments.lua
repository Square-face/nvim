local M = {'folke/todo-comments.nvim'}
M.dependencies = { 'nvim-lua/plenary.nvim' }
M.event = 'VeryLazy'

M.opts = {}

M.keys = {
    { '<leader>n', function() require("todo-comments").jump_next() end, { desc = "Next todo comment" } },
    { '<leader>N', function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" } },
}
return M
