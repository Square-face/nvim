-- Keymaps
local M = {}

M.v = {
    ["<"] = { "<gv", "Unindent selected lines" },
    [">"] = { ">gv", "Unindent selected lines" },
}

M.n = {
    -- Move text
    ["<A-j>"] = { ":m+1 <CR>", "Move line down" },
    ["<A-k>"] = { ":m-2 <CR>", "Move line up" },
    -- Move from buffer to buffer
    ["<C-h>"] = { "<C-w>h", "Move to left buffer" },
    ["<C-j>"] = { "<C-w>j", "Move to down buffer" },
    ["<C-k>"] = { "<C-w>k", "Move to up buffer" },
    ["<C-l>"] = { "<C-w>l", "Move to right buffer" },
}


return M
