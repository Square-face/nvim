local M = {}

vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
  },
}



M.config = function()
    local dap = require('dap')
    require('mason')
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb") -- note that this will error if you provide a non-existent package name

    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            -- CHANGE THIS to your path!
            command = codelldb:get_install_path(),
            args = { "--port", "${port}" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        }
    }

    dap.configurations.rust = {
        {
            name = "Launch",
            type = "codelldb",
            request = "launch",
            cargo = {
                args = { "test", "--no-run" },
            },
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        },
    }
end

return M
