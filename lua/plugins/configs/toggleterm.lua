local M = {}

M.opts = {
    size=20,
    direction = 'float',
    hide_numbers=true,
    on_open = function(t)
        vim.cmd('startinsert')
        vim.api.nvim_buf_set_keymap(t.bufnr, 't', '<Esc>', '<C-\\><C-n>', {noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(t.bufnr, 'n', '<Esc>', 'i<C-c><CR>exit<CR>', {noremap=true, silent=true})
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

    { -- Language specific quick build+run keybind
        '<leader>r',
        ft = { 'rust' }, -- supported languages
        function()
            -- Save
            vim.cmd('w')

            -- build and run
            require('toggleterm').exec_command('cmd=\'cargo run\'')
        end,
        'Save, open terminal, compile and run'
    },

    { -- Language specific quick build+test keybind
        '<leader>t',
        ft = { 'rust' }, -- supported languages
        function()
            -- Save
            vim.cmd('w')

            -- build and run
            require('toggleterm').exec_command('cmd=\'cargo test\'')
        end,
        'Save, open terminal, compile and test'
    },
    { -- Language specific quick build keybind
        '<leader>b',
        ft = { 'rust' }, -- supported languages
        function()
            -- Save
            vim.cmd('w')

            -- build and run
            require('toggleterm').exec_command('cmd=\'cargo build\'')
        end,
        'Save, open terminal, compile'
    }
}

return M
