local Plugin        = { 'nvim-lualine/lualine.nvim' };
Plugin.dependencies = { 'stevearc/overseer.nvim' }
Plugin.lazy         = false;

Plugin.opts         = {
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

Plugin.dependencies = { 'kyazdani42/nvim-web-devicons' }


return Plugin
