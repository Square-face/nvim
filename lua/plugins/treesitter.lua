local plug = { 'nvim-treesitter/nvim-treesitter' }
plug.build = ':TSUpdate'
plug.opts = {}

plug.init = function()
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
end

return plug
