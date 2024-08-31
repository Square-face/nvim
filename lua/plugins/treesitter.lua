local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.opts = {
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

Plugin.build = ":TSUpdate"

Plugin.config = function()
    vim.filetype.add({ extension = { wgsl = "wgsl" } })
    require 'nvim-treesitter.configs'.setup(Plugin.opts)
end

return Plugin
