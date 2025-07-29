local cc_lib = vim.fn.stdpath('config') .. '/third_party/CC-Tweaked'

return {
    "nil_ls",
    "vtsls",
    "astro",
    "svelte",

    ["lua_ls"] = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the server to use LuaJIT (the Lua runtime in Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                },
                workspace = {
                    -- Make the CC:Tweaked API visible to the server
                    library = {
                        [cc_lib] = true,
                    },
                    -- suppress the “sumneko.lua” third-party prompt
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        },
    },
    ["harper_ls"] = {
        settings = {
            ["harper-ls"] = {
                linters = {
                    Spaces = false,
                    Dashes = false,
                },
            },
        },
    },
}
