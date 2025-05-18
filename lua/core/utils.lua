local M = {}
M.lazy_spec = {}


function M.lazy_spec.opts(spec)
    return function()
        local opts = require('configs.' .. spec).opts
        return opts
    end
end

function M.lazy_spec.conf(spec)
    return function() require('configs.' .. spec).config() end
end

return M
