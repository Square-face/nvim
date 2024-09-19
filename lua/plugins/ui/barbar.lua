local Plugin = { 'akinsho/bufferline.nvim' }
Plugin.dependencies = 'nvim-tree/nvim-web-devicons'
Plugin.version = "*"
Plugin.event = 'VeryLazy'

Plugin.opts = {
    ptions = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            },
        },
    },
}

Plugin.keys = {
    { '<A-,>', ':BufferLineCyclePrev<CR>',        silent = true, noremap = true, desc = "Go to previous buffer" },
    { '<A-.>', ':BufferLineCycleNext<CR>',        silent = true, noremap = true, desc = "Go to next buffer" },
    { '<A-s>', ':BufferLinePick<CR>',             silent = true, noremap = true, desc = "Pick buffer to go to" },
    { '<A-1>', ':BufferLineGoToBuffer 1<CR>',     silent = true, noremap = true, desc = "Go to buffer 1" },
    { '<A-2>', ':BufferLineGoToBuffer 2<CR>',     silent = true, noremap = true, desc = "Go to buffer 2" },
    { '<A-3>', ':BufferLineGoToBuffer 3<CR>',     silent = true, noremap = true, desc = "Go to buffer 3" },
    { '<A-4>', ':BufferLineGoToBuffer 4<CR>',     silent = true, noremap = true, desc = "Go to buffer 4" },
    { '<A-5>', ':BufferLineGoToBuffer 5<CR>',     silent = true, noremap = true, desc = "Go to buffer 5" },
    { '<A-6>', ':BufferLineGoToBuffer 6<CR>',     silent = true, noremap = true, desc = "Go to buffer 6" },
    { '<A-7>', ':BufferLineGoToBuffer 7<CR>',     silent = true, noremap = true, desc = "Go to buffer 7" },
    { '<A-8>', ':BufferLineGoToBuffer 8<CR>',     silent = true, noremap = true, desc = "Go to buffer 8" },
    { '<A-9>', ':BufferLineGoToBuffer 9<CR>',     silent = true, noremap = true, desc = "Go to buffer 9" },
    { '<A-d>', ':BufferLineOrderByDirectory<CR>', silent = true, noremap = true, desc = "Sort buffers by dictionary" },
    { '<A-e>', ':BufferLineOrderByExtension<CR>', silent = true, noremap = true, desc = "Sort buffers by extensions" },
    { '<A-p>', ':BufferLineTogglePin<CR>',        silent = true, noremap = true, desc = "Pick a buffer to pin" },
    { '<A-c>', ':BufferLinePickClose<CR>',        silent = true, noremap = true, desc = "Pick a buffer to close" },
    { '<A-->', ':bdelete<CR>',                    silent = true, noremap = true, desc = "Delete current buffer" },
    { '<A-w>', ':bwipeout<CR>',                   silent = true, noremap = true, desc = "Delete current buffer but more" },
}

return Plugin
