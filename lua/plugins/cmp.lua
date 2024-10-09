local plug = { 'hrsh7th/nvim-cmp', name = 'cmp' }
plug.event = "InsertEnter"

plug.dependencies = {
    'neovim/nvim-lspconfig',
    'L3MON4D3/LuaSnip',

    'hrsh7th/cmp-path',
    { 'hrsh7th/cmp-nvim-lsp', name = 'cmp-lsp' },
    { 'onsails/lspkind.nvim', name = 'lspkind' },
}

local function cr(fallback)
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    if cmp.visible() then
        cmp.confirm({ select = true })
    elseif luasnip.expandable() then
        luasnip.expand()
    else
        fallback()
    end
end

local function tab(fallback)
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
    else
        fallback()
    end
end

local function shift_tab(fallback)
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end

plug.opts = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    return {
        mapping = {
            ['<C-d>']     = cmp.mapping.scroll_docs(4),
            ['<C-u>']     = cmp.mapping.scroll_docs(-4),

            ['<Up>']      = cmp.mapping.select_prev_item(),
            ['<Down>']    = cmp.mapping.select_next_item(),

            ['<CR>']      = cmp.mapping(cr, { 'i', 's' }),
            ['<C-Space>'] = cmp.mapping.abort(),

            ['<Tab>']     = cmp.mapping(tab, { 'i', 's' }),
            ['<S-Tab>']   = cmp.mapping(shift_tab, { 'i', 's' }),
        },
        snippet = {
            expand = function(args)
                require 'luasnip'.lsp_expand(args.body)
            end
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'path' },
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol',
                maxwidth = 50,
                ellipsis_char = '...',
            })
        }
    }
end

return plug
