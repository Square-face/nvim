local Plug = { 'akinsho/toggleterm.nvim', lazy = true, auto_scroll = false }

Plug.keys = {
    { 'ft',        '<cmd>TermSelect<CR>', silent = true, noremap = true, desc = 'Search terminals' },
    { '<leader>T', '<cmd>ToggleTerm<CR>', silent = true, noremap = true, desc = 'Toggle Terminal' },
}

Plug.opts = {
    direction = 'float',
    start_in_insert = true,
    on_open = function(term)
        require('which-key').add(
            {
                { 'q',     '<cmd>q<CR>', buffer = term.bufnr },
                { '<ESC>', '<cmd>q<CR>', buffer = term.bufnr }
            }
        )
    end
}

return Plug
