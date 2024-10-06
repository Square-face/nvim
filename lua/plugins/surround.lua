local plug = { 'kylechui/nvim-surround' }
plug.version = '*'
plug.keys = {
    '<C-g>s','<C-g>S',
    'ds', 'cs', 'cS',
    'ys', 'yss', 'yS', 'ySS',
    { 'v', 'S' }, { 'v', 'gS' }
}

plug.opts = {}

return plug
