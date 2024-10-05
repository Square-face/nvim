local plug = {'nvim-telescope/telescope.nvim'}
plug.dependecies = {'nvim-lua/plenary.nvim'}

plug.keys = {
    {'ff', '<cmd>Telescope find_files<cr>', silent=true, noremap=true, desc="Find files"},
    {'fg', '<cmd>Telescope live_grep<cr>',  silent=true, noremap=true, desc="Grep files"},
    {'fb', '<cmd>Telescope buffers<cr>',    silent=true, noremap=true, desc="Find buffers"},
    {'fh', '<cmd>Telescope help_tags<cr>',  silent=true, noremap=true, desc="Find help"},
}

return plug
