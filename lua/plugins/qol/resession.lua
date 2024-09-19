local get_session_name = require('core.utils').get_session_name

local Plugin = { 'stevearc/resession.nvim' }
Plugin.opts = { extensions = { overseer = {} } }
Plugin.lazy = false
Plugin.keys = {
    { "<leader>ss", function() require("resession").save() end,   desc = "Save a session" },
    { "<leader>sl", function() require("resession").load() end,   desc = "Load a session" },
    { "<leader>sd", function() require("resession").delete() end, desc = "Delete a session" },
}

function enter()
    -- Only load the session if nvim was started with no args
    if not (vim.fn.argc(-1) == 0) then return end

    require("resession").load(get_session_name(), { dir = "dirsession", silence_errors = true })

    -- required bcs overseer doesn't properly load tasks if autoload is false
    require("overseer").new_task({ cmd = { "ls" } }):dispose()
end

function leave()
    -- close overseer before saving as it has a tendency of not applying keybinds correctly if opened imediatelly
    require("overseer").close()
    require("resession").save(get_session_name(), { dir = "dirsession", notify = false })
end

Plugin.init = function()
    vim.api.nvim_create_autocmd("VimEnter", { callback = enter })
    vim.api.nvim_create_autocmd("VimLeavePre", { callback = leave })
end

return Plugin
