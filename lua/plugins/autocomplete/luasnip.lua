local Plugin = {'L3MON4D3/LuaSnip'}
Plugin.lazy = true
Plugin.build = vim.g.isnix and "nix-shell -p gnumake --run 'make install_jsregexp'" or "make install_jsregexp"
Plugin.dependencies = 'rafamadriz/friendly-snippets'
Plugin.opts = { history = true, updateevents = 'TextChanged,TextChangedI' }

return Plugin
