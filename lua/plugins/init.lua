
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  { "nvim/nvim-lspconfig", lazy=false },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})


-- Load plugin configs
