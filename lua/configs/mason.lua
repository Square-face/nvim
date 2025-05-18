local mason = {}

mason.opts = { PATH = 'append' }

mason.config = function(_, opts)
    require('mason').setup(opts)

    vim.schedule(function()
        local packages = require('mason-registry').get_installed_packages()
        for _, pkg in pairs(packages) do
            vim.lsp.enable(pkg.spec.neovim.lspconfig)
        end
    end)
end

return mason
