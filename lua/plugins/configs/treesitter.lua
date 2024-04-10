vim.filetype.add({extension = {wgsl = "wgsl"}})

local M = {}

M.opts = {
    -- A list of parser names, or 'all' (the five listed parsers should always be installed)
    ensure_installed = { 'svelte', 'typescript', 'javascript', 'rust', 'sql', 'python', 'lua', 'bash', 'toml', 'yaml', 'json', 'markdown' },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
    },
}

M.build = ":TSUpdate"

M.config = function()
    require'nvim-treesitter.configs'.setup(M.opts)
end

return M
