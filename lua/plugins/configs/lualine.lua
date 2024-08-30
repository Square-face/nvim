local M        = {};

M.dependencies = { 'stevearc/overseer.nvim' }

local colors   = {
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
}

M.opts         = {
    options = {
        theme = 'tokyonight',
        icons_enabled = true,
    },

    sections = {
        lualine_a = { 'mode' },

        lualine_b = { 'branch' },

        lualine_c = {
            {
                'diagnostics',

                sources = { 'nvim_lsp' },

                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'hint' },

                -- diagnostics_color = {
                --     error = 'DiagnosticError', -- Changes diagnostics' error color.
                --     warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                --     info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                --     hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                -- },

                symbols = { error = ' ', warn = ' ', hint = ' ' },
                colored = true,          -- Displays diagnostics status in color if set to true.
                update_in_insert = true, -- Update diagnostics in insert mode.
                always_visible = false,  -- Show diagnostics even if there are none.
            },
            {
                'filename',

                file_status = true,
                path = 1,
            },
        },




        lualine_x = {
            {
                "overseer",
                label = "",         -- Prefix for task counts
                colored = true,     -- Color the task icons and counts
                unique = false,     -- Unique-ify non-running task count by name
                name = nil,         -- List of task names to search for
                name_not = false,   -- When true, invert the name search
                status = nil,       -- List of task statuses to display
                status_not = false, -- When true, invert the status search
            },
            {
                'filetype',

                icon_only = false,
                newfile_status = true,
            },
        },

        lualine_y = { 'encoding' },

        lualine_z = { 'location', 'progress' },
    },

    extensions = { 'toggleterm' }
}

M.dependencies = { 'kyazdani42/nvim-web-devicons' }


return M
