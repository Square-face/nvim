local Plug = { "stevearc/overseer.nvim", name = "overseer" }
Plug.opts = {
    strategy = { "toggleterm", use_shell = true, quit_on_exit = "always" },
    task_editor = {
        bindings = {
            n = {
                ["<esc>"] = "Cancel",
            },
        },
    },
}

local function run()
    local oversser = require("overseer")
    oversser.run_template({ tags = { oversser.TAG.RUN } }, function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf, "n", "<esc>", "<cmd>q<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { silent = true })

        local esc = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
        vim.api.nvim_feedkeys(esc, "t", true)
    end)
end

Plug.cmd = { "OverseerRun", "OverseerToggle" }
Plug.keys = {
    {
        "<leader>to",
        function() require("overseer").toggle() end,
        desc = "Toggle task list",
    },
    {
        "<leader>rt",
        function() require("overseer").run_template() end,
        desc = "Run template",
    },
    { "<leader>rr", run, desc = "Run run template" },
}
return Plug
