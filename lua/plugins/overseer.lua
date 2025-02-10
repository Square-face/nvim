local Plug = { 'stevearc/overseer.nvim', name = 'overseer' }
Plug.opts = {
    strategy = { 'toggleterm', use_shell=true },
    task_editor = {
        bindings = {
            n = {
                ['<esc>'] = "Cancel"
            }
        }
    }
}

local function run()
    local oversser = require('overseer')
    oversser.run_template({ tags = { oversser.TAG.RUN } }, function ()
        local esc = vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true)
        vim.api.nvim_feedkeys(esc, 't', true)
    end)
end

Plug.cmd = { 'OverseerRun', 'OverseerToggle' }
Plug.keys = {
    { '<leader>T',  function() require('overseer').toggle() end,       desc = "Toggle task list" },
    { '<leader>rt', function() require('overseer').run_template() end, desc = "Run template" },
    { '<leader>rr', run,                                               desc = "Run run template" },
}
return Plug
