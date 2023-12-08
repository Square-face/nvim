-- Keybindings
local M = {}
local telescope = require('telescope.builtin')

M.n = {
    -- Telescope
    ["ff"] = { telescope.find_files, "Find files" },
    ["fg"] = { telescope.live_grep , "Find files" },
    ["fb"] = { telescope.buffers , "Find files" },
    ["fh"] = { telescope.help_tags , "Find files" },
    ["ft"] = { telescope.treesitter , "Find files" },

    -- File explorer
    ["<C-n>"] = { ":NvimTreeToggle<CR>", "Toggle file explorer" },
}

return M
