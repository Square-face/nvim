local M = {}

M.opts = {
    panel = {
        enabled = true,
        keymap = {
            jump_prev = "<C-p>",
            jump_next = "<C-n>",
            accept = "<CR>",
            refresh = "gr",
            open = "<C-Space>"
        },
        layout = {
            position = "left", -- | top | left | right
            ratio = 0.4
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = false,
            accept_word = false,
            accept_line = false,
            next = false,
            prev = false,
            dismiss = false,
        },
    },
    filetypes = {
        yaml = false,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = true,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 18.x
    server_opts_overrides = {},
}

return M
