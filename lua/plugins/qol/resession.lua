return {
        'stevearc/resession.nvim',
        dependencies = { 'stevearc/overseer.nvim' },
        opts = { extensions = { overseer = { } } },
        lazy = false,
        keys = {
            { "<leader>ss", function() require("resession").save() end,  desc = "Save a session" },
            { "<leader>sl", function() require("resession").load() end,  desc = "Load a session" },
            { "<leader>sd", function() require("resession").delet() end, desc = "Delete a session" },
        },
        init = function()
            local resession = require "resession"
            local function get_session_name()
                local name = vim.fn.getcwd()
                local branch = vim.trim(vim.fn.system("git branch --show-current"))
                if vim.v.shell_error == 0 then
                    return name .. branch
                else
                    return name
                end
            end
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    -- Only load the session if nvim was started with no args
                    if vim.fn.argc(-1) == 0 then
                        resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
                    end

                    -- required bcs overseer doesn't properly load tasks if autoload is false
                    require("overseer").new_task({ cmd = { "ls" } }):dispose()
                end,
            })
            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    -- close overseer before saving as it has a tendency of applying keybinds correctly if opened imediatelly
                    require("overseer").close()
                    resession.save(get_session_name(), { dir = "dirsession", notify = false })
                end,
            })
        end
    }
