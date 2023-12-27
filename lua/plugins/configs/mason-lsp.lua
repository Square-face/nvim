local M = {}


M.build = ':Mason'
M.cmd = {
    'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog'
}

M.opts = {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd', 'pyright', 'texlab' },
    automatic_installation = true,
}

return M
