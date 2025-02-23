local Plug = { "nvim-neotest/neotest" }
Plug.dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
}

Plug.keys = {
    { '<leader>n', function() require("neotest").run.run() end, desc='Run tests' },
    { '<leader>rs', function() require("neotest").run.run() end, desc='Run tests' },
}

Plug.opts = function()
    return {
        adapters = {
            require('rustaceanvim.neotest'),
        },
    }
end

return Plug
