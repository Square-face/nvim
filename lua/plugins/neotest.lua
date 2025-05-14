local Plug = { 'nvim-neotest/neotest' }
Plug.dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
        'rcasia/neotest-java',
        ft = 'java',
        dependencies = {
            'mfussenegger/nvim-jdtls',
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        }
    }
}

Plug.keys = {
    { '<leader>tt',  function() require("neotest").run.run(vim.fn.getcwd()) end,            desc = 'Run tests (All)' },
    { '<leader>tn',  function() require("neotest").run.run() end,                        desc = 'Run tests (Nearest)' },
    { '<leader>tf',  function() require("neotest").run.run(vim.fn.expand("%")) end,      desc = 'Run tests (File)' },
    { '<leader>tl',  function() require("neotest").run.run_last() end,                   desc = 'Run tests (Last)' },
    { '<leader>tat', function() require("neotest").run.attach(vim.fn.getcwd()) end,         desc = 'Run attached tests (All)' },
    { '<leader>tan', function() require("neotest").run.attach() end,                     desc = 'Run attached tests (Nearest)' },
    { '<leader>taf', function() require("neotest").run.attach(vim.fn.expand("%")) end,   desc = 'Run attached tests (File)' },
    { '<leader>ts',  function() require("neotest").summary.toggle() end,                 desc = 'Toggle neotest summary' },
    { '<leader>tS',  function() require("neotest").run.stop() end,                       desc = 'Stop tests' },
    { '<leader>tw',  function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = 'Toggle Watch (tests)' },
}

Plug.opts = function()
    return {
        icons = {
            running_animated = {'', '', '', '', '', ''}
        },
        adapters = {
            require('rustaceanvim.neotest'),
            require('neotest-java')({}),
        },
    }
end

return Plug
