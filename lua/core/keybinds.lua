-- Keybindings
local M = {}
local telescope = require('telescope.builtin')

M.n = {
    -- Telescope
    ["ff"] = { telescope.find_files, "Find files" },
    ["fg"] = { telescope.live_grep , "Find files" },
    ["fb"] = { telescope.buffers , "Find files" },
    ["fh"] = { telescope.help_tags , "Find files" },
}

return M
