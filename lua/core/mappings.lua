-- Keybinds
local M = {}

M.v =  {
    ["<"] = { "<gv", "Unindent selected lines" },
    [">"] = { ">gv", "Unindent selected lines" },
}

M.n = {
    ["<C-k>"] = { ":m-2 <CR>", "Move line up" },
    ["<C-j>"] = { ":m+1 <CR>", "Move line down" },
    ["<C-n>"] = { ":NvimTreeToggle<CR>", "Toggle file explorer" }
}

return M
