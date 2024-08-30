local M = {}

M.opts = {
    size = 20,
    direction = 'float',
    hide_numbers = true,
    on_open = function(t)
        vim.cmd('startinsert')
        vim.api.nvim_buf_set_keymap(t.bufnr, 't', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(t.bufnr, 'n', '<Esc>', 'i<C-c><CR>exit<CR>', { noremap = true, silent = true })
    end,
}
M.keys = {
    { -- toggle general terminal
        '<C-t>',
        function()
            require('toggleterm').toggle_command()
        end,
        desc = 'Toggle terminal',
    },
}

return M
