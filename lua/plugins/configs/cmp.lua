local luasnip = require("luasnip")
local cmp = require "cmp"
local utils = require "core.utils"

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local options = {
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
        { name = 'nvim_lsp' }, -- Language Server
        { name = 'luasnip' }, -- Snippet Engine
    }, {
        { name = 'buffer' },
    }),


    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
        return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        end
    end
}


-- Configure mappings

local mappings = {
    ["<Tab>"] = { function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
            -- that way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, "Select next item" },

    ["<S-Tab>"] = { function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, "Select previous item" },
    ['<C-j>'] = { function() cmp.mapping.scroll_docs(-4) end, "Scroll down"},
    ['<C-k>'] = { function() cmp.mapping.scroll_docs(4) end, "Scroll up"},
}

utils.load_section_mapping({i = mappings,})



return options
