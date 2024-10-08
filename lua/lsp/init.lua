-- Setup language servers.
-- Specific LSP configs are found in the settings folder and are used with `require 'lsp.settings.<lsp>`


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

local executors = require('rustaceanvim.executors')
vim.g.rustaceanvim = {
    tools = {
        executor = executors.toggleterm,
        float_win_config = {
            auto_focus = true,
        },
    },
    -- LSP configuration
    server = require 'lsp.settings.rust',
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
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
            if vim.bo.filetype == "rust" then
                vim.cmd.RustLsp('codeAction')
            else
                vim.lsp.buf.code_action()
            end
        end, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
