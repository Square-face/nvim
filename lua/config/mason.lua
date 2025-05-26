local mason = {}

mason.config = function(_, opts)
    require("mason").setup(opts)

    local packages = require("mason-registry").get_installed_packages()
    for _, pkg in pairs(packages) do
        if pkg.spec.neovim == nil then
            vim.lsp.enable(pkg.name)
        else
            vim.lsp.enable(pkg.spec.neovim.lspconfig)
        end
    end
end

return mason
