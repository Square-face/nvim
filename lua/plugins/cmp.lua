local plug = { 'hrsh7th/nvim-cmp' }
plug.event = "InsertEnter"

plug.dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
}

local function super_tab(fallback)
    local cmp = require 'cmp'
    if cmp.visible() then
        cmp.select_next_item()
    else
        fallback()
    end
end

local function shift_super_tab(fallback)
    local cmp = require 'cmp'
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

plug.opts = function()
    local cmp = require 'cmp'

    return {
        mapping = {
            ['<C-d>']   = cmp.mapping.scroll_docs(4),
            ['<C-u>']   = cmp.mapping.scroll_docs(-4),

            ['<Up>']    = cmp.mapping.select_prev_item(),
            ['<Down>']  = cmp.mapping.select_next_item(),

            ['<CR>']    = cmp.mapping.confirm({ select = true }),
            ['<Esc>']   = cmp.mapping.abort(),

            ['<Tab>']   = cmp.mapping(super_tab, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(shift_super_tab, { 'i', 's' }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' }
        })
    }
end

return plug
