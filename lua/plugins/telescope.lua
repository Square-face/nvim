local ts = { 'nvim-telescope/telescope.nvim' }

ts.dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' }

ts.keys = {
    { 'Ff', '<cmd>Telescope find_files<cr>',         silent = true, noremap = true, desc = "Find files" },
    { 'Fg', '<cmd>Telescope live_grep<cr>',          silent = true, noremap = true, desc = "Grep files" },
    { 'Fb', '<cmd>Telescope buffers<cr>',            silent = true, noremap = true, desc = "Find buffers" },
    { 'Fh', '<cmd>Telescope help_tags<cr>',          silent = true, noremap = true, desc = "Find help" },
    { 'Fr', '<cmd>Telescope lsp_references<cr>',     silent = true, noremap = true, desc = "Lsp Refrences" },
    { 'Fo', '<cmd>Telescope lsp_incoming_calls<cr>', silent = true, noremap = true, desc = "Lsp outgoing calls" },
    { 'Fi', '<cmd>Telescope lsp_outgoing_calls<cr>', silent = true, noremap = true, desc = "Lsp incomming calls" },
}

ts.opts = { }

ts.cmd = { 'Telescope' }

return ts
