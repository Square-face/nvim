local bbq = {}

bbq.opts = {}

bbq.config = function(_, opts)
    require("barbecue").setup(opts)
    require("barbecue.ui").toggle(false)

    local wk = require("which-key")

    wk.add({
        { "<leader>bq", require("barbecue.ui").toggle, noremap = true, desc = "Toggle barbecue" },
    })
end

return bbq
