-- Keybindings
local M = {}
local telescope = require('telescope.builtin')
local terminal = require('toggleterm')

M.n = {
    -- Telescope
    ["ff"] = { telescope.find_files, "Find files" },
    ["fg"] = { telescope.live_grep , "Find files" },
    ["fb"] = { telescope.buffers , "Find files" },
    ["fh"] = { telescope.help_tags , "Find files" },
    ["ft"] = { telescope.treesitter , "Find files" },

    -- File explorer
    ["<C-n>"] = { ":NvimTreeToggle<CR>", "Toggle file explorer" },
    ["<C-s>"] = { ":w<CR>", "Save current file"},

    -- Toggle Term
    ["<C-t>"] = { terminal.toggle_command, "Toggle terminal"},
    ["<C-c>"] = {
        function ()
            terminal.exec_command("cmd=\"cargo run\"")
        end,
        "Toggle terminal and cargo run"}
}

M.t = {
    ["<C-t>"] = { "<C-\\><C-n>:ToggleTerm<CR>", "Toggle terminal"},
    ["<Esc>"] = {
        function ()
            vim.cmd(':bd!')
        end,
        "Exit terminal mode" },
}

return M
