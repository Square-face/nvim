local M = {}
M.config = function()
    require 'lsp'
end

M.init_options = {
    userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
    }
}

return M
