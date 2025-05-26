local lspc = {}

lspc.config = function()
    local signs = {
        [vim.diagnostic.severity.ERROR] = "󰅚",
        [vim.diagnostic.severity.WARN] = "󰀪",
        [vim.diagnostic.severity.HINT] = "󰌶",
        [vim.diagnostic.severity.INFO] = "",
    }
    vim.diagnostic.config({
        update_in_insert = true,
        severity_sort = true,
        signs = {
            text = signs,
        },
    })

    -- require("lsp.harper")

    -- vim.lsp.enable('nil_ls')

    local map = require("core.utils").map

    map("n", "<leader>fc", vim.lsp.buf.format, { desc = "Format code" })
    map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Use code acion" })
    map("n", "<C-j>", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Jump to next diagnostic" })
    map("n", "<C-k>", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Jump to previous diagnostic" })

    if vim.g.nix then
        local servers = require("config.lsp.servers")

        for k, v in pairs(servers) do
            if type(k) == "number" and type(v) == "string" then
                vim.lsp.enable(v)
            elseif type(k) == "string" and type(v) == "table" then
                vim.lsp.config[k] = v
                vim.lsp.enable(k)
            else
                vim.notify_once("Invalid server config", vim.log.levels.ERROR)
            end
        end
    end
end

return lspc
