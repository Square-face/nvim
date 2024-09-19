local Plugin = { "nvim-neotest/neotest" }
Plugin.lazy = true
Plugin.keys = {
    { '<leader>ts', ':Neotest summary<CR>', desc = "Toggles the summary for neotest",  silent = true, noremap = true },
    { '<leader>tr', ':Neotest run<CR>',     desc = "Run test under cursor",            silent = true, noremap = true },
}

Plugin.dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rustaceanvim",
}


Plugin.opts = function()
    return { adapters = { require("rustaceanvim.neotest"), } }
end

return Plugin
