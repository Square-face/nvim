local Plug = { "L3MON4D3/LuaSnip" }
Plug.build = vim.g.nix and "nix-shell -p cmake --run 'make install_jsregxp'" or "make install_jsregexp"
Plug.dependencies = { "rafamadriz/friendly-snippets" }
Plug.lazy = true

Plug.opts = {
    -- Allow autotrigger snippets
    enable_autosnippets = true,
    -- For equivalent of UltiSnips visual selection
    store_selection_keys = "<Tab>",
    -- Event on which to check for exiting a snippet's region
    region_check_events = "InsertEnter",
    delete_check_events = "InsertLeave",
}

Plug.config = function(_, opts)
    local dir = vim.fn.stdpath("config") .. "/snippets"
    require("luasnip.loaders.from_lua").load({ paths = dir })
    require("luasnip").config.set_config(opts)
end

return Plug
