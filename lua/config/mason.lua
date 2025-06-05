local mason = {}

mason.config = function(_, opts)
    require("mason").setup(opts)

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- Use all installed servers by Mason
    mason_lspconfig.setup()

    -- Get a list of all installed servers
    local servers = mason_lspconfig.get_installed_servers()

    for _, server_name in ipairs(servers) do
        lspconfig[server_name].setup({})
    end
end

return mason
