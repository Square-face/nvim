local Plugins = { "mistricky/codesnap.nvim" }
Plugins.build = vim.g.isnix and "nix-shell -p gnumake --run 'make'" or "make"
Plugins.keys = { { "<leader>cc", ":CodeSnap<CR>", mode="x", desc = "Save selected code snapshot into clipboard" } }

Plugins.opts = {
    has_breadcrumbs = true,
    has_linenumbers = true,
    show_workspace = true,
    watermark = "",
}


return Plugins
