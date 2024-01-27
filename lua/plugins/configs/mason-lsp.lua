local M = {}


M.cmd = {
    'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog'
}

M.opts = {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd', 'pyright', 'texlab', 'json-lsp', 'emmet-language-server' },
    automatic_installation = true,
}

return M
