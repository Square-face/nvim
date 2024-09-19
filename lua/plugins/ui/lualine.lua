local Plugin        = { 'nvim-lualine/lualine.nvim' };
Plugin.dependencies = 'stevearc/overseer.nvim'
Plugin.event        = 'VeryLazy';

Plugin.opts         = {
    options = {
        theme = 'auto',
        globalstatus = true,
        icons_enabled = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
    },

    sections = {
        lualine_a = { 'mode' },

        lualine_b = { 'branch' },

        lualine_c = {
            {
                'filetype',

                icon_only = false,
                newfile_status = true,
            },

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
                'filename',

                file_status = true,
                path = 1,
            },
        },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
    },
    extensions = { 'lazy', 'toggleterm' }
}

Plugin.dependencies = { 'kyazdani42/nvim-web-devicons' }


return Plugin
