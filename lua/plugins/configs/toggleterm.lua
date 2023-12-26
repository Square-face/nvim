local options = {
    size=20,
    direction = "float",
    hide_numbers=true,
    on_open = function(t)
        vim.cmd("startinsert")
        vim.api.nvim_buf_set_keymap(t.bufnr, 't', '<Esc>', '<C-\\><C-n>', {noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(t.bufnr, 'n', '<Esc>', '<cmd>quit<CR>', {noremap=true, silent=true})
    end,
}

return options
