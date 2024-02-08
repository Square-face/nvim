local M = {}


M.cmd = {
    'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog'
}

M.opts = {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright', 'texlab', 'ltex', 'jsonls', 'emmet_language_server', 'typos_lsp' },
    automatic_installation = true,
}

return M
