local plug = { 'hedyhli/outline.nvim', name = 'outline' }
plug.opts = { outline_window = { position = 'left' } }

plug.cmd = { 'Outline', 'OutlineOpen' }
plug.keys = {
    { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
}

return plug
