local plug = { 'folke/which-key.nvim', name = 'which-key' }

plug.event = 'VeryLazy'

local function random_float()
    local rand_float = string.format("%.2f", math.random() * 100)

    -- Check if we are in visual mode
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" or mode == "\22" then     -- "\22" is CTRL-V (block mode)
        -- Replace visual selection
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)
        vim.cmd("normal! gv\"_d", false)
    end

    -- Insert the random float
    vim.api.nvim_put({ rand_float }, "", true, true)
end

plug.opts = {
    spec = {
        { '<ESC>', '<cmd>nohlsearch<CR>',                                        mode = 'n', silent = true, noremap = true, desc = 'Hide search results', },
        { '?',     function() require("which-key").show({ global = false }) end, mode = 'n', silent = true, noremap = true, desc = 'Buffer Local Keymaps (which-key)', },
        {
            mode = { 'n', 'i' },
            { '<A-j>', function() vim.cmd('m+' .. vim.v.count1) end,     noremap = true, desc = 'Move line down' },
            { '<A-k>', function() vim.cmd('m-' .. 1 + vim.v.count1) end, noremap = true, desc = 'Move line up' },
        },
        {
            mode = { 'v' },
            { '<A-j>', function() vim.cmd("m'>+" .. vim.v.count1) end,     noremap = true, desc = 'Move line down' },
            { '<A-k>', function() vim.cmd("m'<-" .. 1 + vim.v.count1) end, noremap = true, desc = 'Move line up' },
            { '<',     '<gv',                                              noremap = true, desc = 'Unindent line' },
            { '>',     '>gv',                                              noremap = true, desc = 'Unindent line' },
        },
        {
            mode = { 'n', 'v' },
            { '<leader>rf', random_float, noremap = true, desc = 'Generate a random float value between 0 and 100' },
        },
        {
            mode = { 't' },
            { '<esc>', '<C-\\><C-n>', silent = true, noremap = true, desc = 'Exit insert mode' }
        }
    }
}

return plug
