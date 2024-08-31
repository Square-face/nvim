-- Set leader key for keybinds
vim.g.mapleader = ' '

-- Lazy load plugins
return {
    { import = "plugins.ui" },
    { import = "plugins.lsp" },
    { import = "plugins.autocomplete" },
}
