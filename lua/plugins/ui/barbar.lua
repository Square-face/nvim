local Plugin = { 'akinsho/bufferline.nvim' }
Plugin.dependencies = 'nvim-tree/nvim-web-devicons'
Plugin.version = "*"
Plugin.event = 'VeryLazy'

Plugin.opts = {
    options = {
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
    { '<A-,>', ':BufferLineCyclePrev<CR>' },
    { '<A-.>', ':BufferLineCycleNext<CR>' },
    { '<A-1>', ':BufferLineGoToBuffer 1<CR>' },
    { '<A-2>', ':BufferLineGoToBuffer 2<CR>' },
    { '<A-3>', ':BufferLineGoToBuffer 3<CR>' },
    { '<A-4>', ':BufferLineGoToBuffer 4<CR>' },
    { '<A-5>', ':BufferLineGoToBuffer 5<CR>' },
    { '<A-6>', ':BufferLineGoToBuffer 6<CR>' },
    { '<A-7>', ':BufferLineGoToBuffer 7<CR>' },
    { '<A-8>', ':BufferLineGoToBuffer 8<CR>' },
    { '<A-9>', ':BufferLineGoToBuffer 9<CR>' },
    { '<A-->', ':bdelete<CR>' },
    { '<A-c>', ':BufferLinePickClose<CR>' },
    { '<A-w>', ':bwipeout<CR>' },
    { '<A-p>', ':BufferLineTogglePin<CR>' },
    { '<A-s>', ':BufferLinePick<CR>' },
    { '<A-d>', ':BufferLineOrderByDirectory<CR>' },
    { '<A-e>', ':BufferLineOrderByExtension<CR>' },
}

return Plugin
