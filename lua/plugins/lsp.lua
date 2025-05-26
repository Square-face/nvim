local lazy_spec = require("core.utils").lazy_spec

local lspconfig = {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "rachartier/tiny-inline-diagnostic.nvim", "williamboman/mason.nvim" },
    config = lazy_spec.conf("lspconfig"),
}

local mason = {
    "williamboman/mason.nvim",
    name = "mason",
    lazy = true,
    cond = not vim.g.nix,
    opts = { PATH = "append" },
    config = lazy_spec.conf("mason"),
}

local trouble = {
    "folke/trouble.nvim",
    name = "trouble",
    event = "LspAttach",
    cmd = "Trouble",

    config = function(_, opts)
        require('trouble').setup(opts)
        local map = require("core.utils").nmap

        map("<leader>xx", function() require('trouble').toggle("preview_float") end, { desc = "Diagnostics (Trouble)" })
        map("<leader>xc", function() require('trouble').toggle("cascade") end, { desc = "Diagnostics (Trouble)" })
    end,

    opts = {
        modes = {
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = { 0, -2 },
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                },
            },
            cascade = {
                mode = "diagnostics", -- inherit from diagnostics mode
                filter = function(items)
                    local severity = vim.diagnostic.severity.HINT
                    for _, item in ipairs(items) do
                        severity = math.min(severity, item.severity)
                    end
                    return vim.tbl_filter(function(item)
                        return item.severity == severity
                    end, items)
                end,
            },
        },
    },
}

local lazydev = {
    "folke/lazydev.nvim",
    name = "lazydev",
    ft = "lua",

    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}

local jdtls = {
    'mfussenegger/nvim-jdtls',
    name = "jdtls",
    ft = "java",
    cond = vim.fn.executable('jdtls') == 1,

    opts = {
        cmd = { vim.fn.exepath('jdtls') },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    },

    config = function(_, opts)
        require('jdtls').start_or_attach(opts)
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*.java",
            callback = function()
                require('jdtls').start_or_attach(opts)
            end,
        })
    end
}

local vimtex = {
    "lervag/vimtex",
    cond = vim.fn.executable('latexmk') == 1,
    init = function ()
        vim.g.vimtex_view_method = "zathura"
    end
}

local texpresso = {
    "let-def/texpresso.vim",
    name = "texpresso",
    cond = vim.fn.executable('texpresso') == 1,
    config = function()
        require('texpresso').texpresso_path = vim.fn.exepath('texpresso')
    end
}

return { lspconfig, mason, trouble, lazydev, jdtls, vimtex, texpresso }
