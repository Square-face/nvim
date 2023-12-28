local M = {}

-- Load a set of keybinds from a keybinds object
-- keybind objects should have the first set of keys matching modes, i.e 'n', 'v', 't', 'i'.
-- The mappings inside should be configured as ['trigger'] = { 'result', 'description' }
-- Example:
-- {
--   v = {
--      ['<'] = { '<gv', 'unindent line' }
--   }
-- }
M.load_section_mapping = function(section)
    for mode, mappings in pairs(section) do
        for trigger, mapping in pairs(mappings) do
            vim.keymap.set(mode, trigger, mapping[1], {noremap = true})
        end
    end
end

M.load_mappings = function()
    M.load_section_mapping(require('core.mappings'))
end

-- basicly just a table merger
-- takes in basic a as a table and imports the config table from an external resource
M.extended = function (basic, config)

    local modified = basic
    local t2 = require(config)

    for key, value in pairs(t2) do
        if (type(value) == 'table') and (type(basic[key] or false) == 'table') then
            extended(basic[key], t2[key])
        else
            modified[key] = value
        end
    end
    return modified
end

return M
