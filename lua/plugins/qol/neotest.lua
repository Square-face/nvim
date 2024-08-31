local Plugin = { "nvim-neotest/neotest" }
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
