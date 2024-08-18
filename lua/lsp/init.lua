-- Setup language servers.
-- Specific LSP configs are found in the settings folder and are used with `require 'lsp.config.<lsp>`


local lsp = require('lspconfig')

lsp.lua_ls.setup(require 'lsp.settings.lua')
lsp.texlab.setup(require 'lsp.settings.texlab')
lsp.emmet_language_server.setup(require 'lsp.settings.emmet')
lsp.pyright.setup(require 'lsp.settings.pyright')
lsp.jsonls.setup({})
-- lsp.typos_lsp.setup {}
lsp.html.setup({})
lsp.svelte.setup({})
lsp.tsserver.setup({})
lsp.eslint.setup({})
lsp.ltex.setup({})
lsp.textlsp.setup({
    filetypes = { 'markdown' },
})
lsp.clangd.setup({})

-- Skip setting up unsupported lsps if on a linux machine
if vim.fn.has('linux') == 0 then
    lsp.wgsl_analyzer.setup({})
    lsp.glsl_analyzer.setup({})
end


vim.g.rustaceanvim = {
    tools = {
        float_win_config = {
            auto_focus = true,
        },
    },
    -- LSP configuration
    server = {
        settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                cargo = {
                    features = "all"
                },
                diagnostics = {
                    disabled = {
                        'inactive-code'
                    }
                },
                check = {
                    command = "clippy"
                },
                -- Other Settings ...
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            -- optional: --
                            "component",
                            "server",
                        },
                    },
                },
            },
        },
    },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
