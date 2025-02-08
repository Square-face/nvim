local Plug = { 'stevearc/overseer.nvim', name = 'overseer' }
Plug.opts = {
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
    oversser.run_template({ tags = { oversser.TAG.RUN } }, function(task)
        if task then
            oversser.run_action(task, 'open float')
        end
    end)
end

Plug.cmd = { 'OverseerRun', 'OverseerToggle' }
Plug.keys = {
    { '<leader>t',  function() require('overseer').toggle() end,       desc = "Toggle task list" },
    { '<leader>rt', function() require('overseer').run_template() end, desc = "Run template" },
    { '<leader>rr', run,                                               desc = "Run run template" },
}
return Plug
