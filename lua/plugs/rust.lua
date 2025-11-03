return {
    'mrcjkb/rustaceanvim',
    version = '6^',
    ft = 'rust',
    init = function()
        vim.g.rustaceanvim = {
            server = {
                on_attach = function(client, bufnr)
                    vim.keymap.set( "n", "<leader>ca", function()
                        vim.cmd.RustLsp('codeAction')
                    end, { silent = true, buffer = bufnr })

                    vim.keymap.set( "n", "K", function()
                        vim.cmd.RustLsp({'hover', 'actions'})
                    end, { silent = true, buffer = bufnr })
                end,
            },
        }
    end
}
