
-- LSP
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, {desc="code action"})
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, {desc="format file"})
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, {desc="rename variable"})

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc="go to definition"})
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, {desc="go to refrences"})

vim.keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, {desc="go to next diagnostic"})
vim.keymap.set("n", "<C-K>", function() vim.diagnostic.goto_prev() end, {desc="go to previous diagnostic"})
