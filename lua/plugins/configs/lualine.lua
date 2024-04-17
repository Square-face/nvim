local M = {};

local colors = {
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

M.opts = {
    options = {
        theme = 'tokyonight',
        icons_enabled = true,
    },

    sections = {
        lualine_a = { 'mode' },

        lualine_b = { 'branch' },

        lualine_c = {
            {
                'filename',

                file_status = true,
                path = 1,
            },
        },




        lualine_x = {
            {
                'diagnostics',

                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { 'nvim_lsp' },

                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },

                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },

                symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                colored = true,          -- Displays diagnostics status in color if set to true.
                update_in_insert = true, -- Update diagnostics in insert mode.
                always_visible = true,   -- Show diagnostics even if there are none.
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
