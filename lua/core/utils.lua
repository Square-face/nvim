local M = {}
M.lazy_spec = {}

function M.lazy_spec.opts(spec)
    return function()
        local opts = require("config." .. spec).opts
        return opts
    end
end

function M.lazy_spec.conf(spec)
    return function() require("config." .. spec).config() end
end

function M.map(mode, lhs, rhs, opts)
    local modes = type(mode) == "string" and { mode } or mode

    opts = opts or {}
    opts.silent = opts.silent ~= false

    vim.keymap.set(modes, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
    M.map("n", lhs, rhs, opts)
end

vim.api.nvim_create_autocmd({ "BufEnter", nil }, {
    callback = function()
        vim.cmd("filetype detect")
    end
})

return M
