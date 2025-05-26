local ba = {}
ba.opts = {}
ba.config = function()
    local map = require("core.utils").map

    map("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Switch to next tab" })
    map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Switch to previous tab" })

    map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { desc = "Move tab left" })
    map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { desc = "Move tab right" })

    map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { desc = "Go to tab 1" })
    map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { desc = "Go to tab 2" })
    map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { desc = "Go to tab 3" })
    map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { desc = "Go to tab 4" })
    map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { desc = "Go to tab 5" })
    map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { desc = "Go to tab 6" })
    map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { desc = "Go to tab 7" })
    map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { desc = "Go to tab 8" })
    map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { desc = "Go to tab 9" })

    map("n", "<A-0>", "<Cmd>BufferLast<CR>", { desc = "Go to last tab" })

    map("n", "<A-p>", "<Cmd>BufferPin<CR>", { desc = "Pin current tab" })

    map("n", "<A-->", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })

    require("barbar").setup({})
end

return ba
