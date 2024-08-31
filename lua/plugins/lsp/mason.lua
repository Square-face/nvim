local Plugin = { 'williamboman/mason-lspconfig.nvim' }
Plugin.cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' }
Plugin.lazy = true
Plugin.dependencies = { {
    'williamboman/mason.nvim',
    lazy = true,
    opts = { PATH = 'append' }
} }


Plugin.opts = {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright', 'texlab', 'ltex', 'jsonls', 'emmet_language_server', 'typos_lsp' },
    automatic_installation = true,
}

return Plugin
