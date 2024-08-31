local Plugin = { 'romgrk/barbar.nvim' }
Plugin.lazy = false

Plugin.opts = {}

Plugin.init = function() vim.g.barbar_auto_setup = false end

Plugin.keys = {
    { '<A-,>',     ':BufferPrevious<CR>' },
    { '<A-.>',     ':BufferNext<CR>' },
    { '<A-;>',     ':BufferMovePrevious<CR>' },
    { '<A-:>',     ':BufferMoveNext<CR>' },
    { '<A-1>',     ':BufferGoto 1<CR>' },
    { '<A-2>',     ':BufferGoto 2<CR>' },
    { '<A-3>',     ':BufferGoto 3<CR>' },
    { '<A-4>',     ':BufferGoto 4<CR>' },
    { '<A-5>',     ':BufferGoto 5<CR>' },
    { '<A-6>',     ':BufferGoto 6<CR>' },
    { '<A-7>',     ':BufferGoto 7<CR>' },
    { '<A-8>',     ':BufferGoto 8<CR>' },
    { '<A-9>',     ':BufferGoto 9<CR>' },
    { '<A-0>',     ':BufferLast<CR>' },
    { '<A-->',     ':BufferClose<CR>' },
    { '<A-w>',     ':BufferWipeout<CR>' },
    { '<A-p>',     ':BufferPin<CR>' },
    { '<A-s>',     ':BufferPick<CR>' },
    { '<A-a>',     ':BufferOrderByBufferNumber<CR>' },
    { '<A-Tab>',   ':BufferNext<CR>' },
    { '<A-S-Tab>', ':BufferPrevious<CR>' },
}

Plugin.dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
}

return Plugin
