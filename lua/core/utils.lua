local M = {}

-- Load a set of keybinds from a keybinds object
-- keybind objects should have the first set of keys matching modes, i.e "n", "v", "t", "i".
-- The mappings inside should be configured as ["trigger"] = { "result", "description" }
-- Example:
-- {
--   v = {
--      ["<"] = { "<gv", "unindent line" }
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
    M.load_section_mapping(require("core.mappings"))
    M.load_section_mapping(require("core.keybinds"))
end

return M
