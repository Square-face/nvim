local plug = {'justinmk/vim-sneak'}
plug.dependencies  = {'tpope/vim-repeat'}

plug.keys = {
    {'<leader>s', '<Plug>Sneak_s'},
    {'<leader>S', '<Plug>Sneak_S'},
    {'<leader>f', '<Plug>Sneak_f'},
    {'<leader>F', '<Plug>Sneak_F'},
    {'<leader>t', '<Plug>Sneak_t'},
    {'<leader>T', '<Plug>Sneak_T'},
}

return plug
