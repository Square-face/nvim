local opts = {
    settings = {
        ["harper-ls"] = {
            linters = {
                Spaces = false,
                Dashes = false,
            }
        }
    },
}

return function()
    require 'lspconfig'.harper_ls.setup(opts)
end
