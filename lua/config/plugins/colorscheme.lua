plug = {
    "akinsho/horizon.nvim",
    lazy = false, priority = 1000,
}

plug.init = function()
    vim.cmd.colorscheme('horizon')
end

return plug
