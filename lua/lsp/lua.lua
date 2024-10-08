local function setup(client)
    if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
            return
        end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
            version = 'LuaJIT'
        },

        workspace = {
            checkThirdParty = false,
            library = {
                vim.env.VIMRUNTIME
            }
        }
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local opts = {
    on_init = setup,

    settings = { Lua = {} },
    capabilities = capabilities,
}

return function()
    require 'lspconfig'.lua_ls.setup(opts)
end
