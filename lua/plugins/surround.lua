local plug = { 'kylechui/nvim-surround', name = 'surround' }
plug.version = '*'

plug.keys = {
    { 'ds',  mode = 'n', desc = "Delete surround" },
    { 'cs',  mode = 'n', desc = "Change surround" },
    { 'cS',  mode = 'n', desc = "Change surround (newline)" },
    { 'ys',  mode = 'n', desc = "Create surround" },
    { 'yS',  mode = 'n', desc = "Create surround (newline)" },
    { 'yss', mode = 'n', desc = "Create surround (entire line)" },
    { 'ySS', mode = 'n', desc = "Create surround (for entire line) (newline)" },
}

plug.opts = {}

return plug
