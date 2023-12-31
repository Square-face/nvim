local M = {}

M.opts = {
    init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        require('hover.providers.man')
        require('hover.providers.dictionary')
    end,

    preview_opts = {
        border = 'single'
    },

    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = true,
    title = false,

    mouse_providers = {
        'LSP'
    },

    mouse_delay = 1000
}

M.keys = {
    { 'K', function() require('hover').hover() end },
    { 'gK', function() require('hover').hover_select() end },
}

return M
