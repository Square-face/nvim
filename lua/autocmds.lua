vim.api.nvim_create_autocmd({ 'LspAttach' }, {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        vim.lsp.completion.enable(true, client.id, 0, { autotrigger = true })
        vim.lsp.inlay_hint.enable(true)
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { silent = true, buffer = true, desc = "Format code" })
        vim.keymap.set("i", "<C-space>", vim.lsp.completion.get,
            { silent = true, buffer = true, desc = "Trigger Autocomplete" })
    end
})
