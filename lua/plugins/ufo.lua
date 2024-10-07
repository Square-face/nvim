local plug = { 'kevinhwang91/nvim-ufo' }
plug.dependencies = { 'kevinhwang91/promise-async' }
plug.opts = {}
plug.event = 'BufEnter'

plug.init = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
end

return plug
