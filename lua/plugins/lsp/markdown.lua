local Plugin = { 'iamcco/markdown-preview.nvim' }

Plugin.cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' }
Plugin.ft = { 'markdown' }

Plugin.build = vim.g.isnix and "nix-shell -p corepack nodejs --run 'cd app && yarn install'" or "cd app && yarn install"

Plugin.init = function()
    vim.g.mkdp_echo_preview_url = 1
end


return Plugin
