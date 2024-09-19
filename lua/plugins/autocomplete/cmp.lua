local Plugin = { 'hrsh7th/nvim-cmp' }

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

Plugin.event = 'InsertEnter'
Plugin.dependencies = {
    'windwp/nvim-autopairs',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind.nvim',
    'uga-rosa/cmp-dictionary',
}

Plugin.opts = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    require("cmp_dictionary").setup({
        paths = { "/usr/share/dict/words" },
        exact_length = 2,
    })

    return {
        enabled = function()
            return not (vim.api.nvim_get_option_value("buftype", {}) == 'prompt')
        end,

        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        sources = cmp.config.sources({
            { name = 'path' },     -- File paths
            { name = 'nvim_lsp' }, -- Language Server
            { name = 'luasnip' },  -- Snippet Engine
            { name = 'dictionary', keyword_length = 2 },
        }),

        mapping = {
            ['<Up>'] = cmp.mapping.select_prev_item(),
            ['<Down>'] = cmp.mapping.select_next_item(),
            ['<C-j>'] = cmp.mapping.scroll_docs(4),
            ['<C-k>'] = cmp.mapping.scroll_docs(-4),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() and has_words_before() then
                    cmp.select_next_item()
                elseif require('luasnip').expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's', }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require('luasnip').jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's', }),
        },

        formatting = {
            format = require('lspkind').cmp_format({
                mode = "symbol",
                maxwidth = 50,
                ellipsis_char = '...',
            })
        },

        experimental = {
            ghost_text = true,
        },
    }
end



return Plugin
