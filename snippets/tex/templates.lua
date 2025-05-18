local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local r = ls.expand_repeat
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- integral functions
-- generate \int_{<>}^{<>}
local int1 = function(args, snip)
    local vars = tonumber(snip.captures[1])
    local nodes = {}
    for j = 1, vars do
        table.insert(nodes, t("\\int_{"))
        table.insert(nodes, r(2 * j - 1, "lb" .. tostring(j), i(1))) -- thanks L3MON4D3 for finding the index issue
        table.insert(nodes, t("}^{"))
        table.insert(nodes, r(2 * j, "ub" .. tostring(j), i(1))) -- please remember to count and don't be like me
        table.insert(nodes, t("} "))
    end
    return sn(nil, nodes)
end

-- generate \dd <>
local int2 = function(args, snip)
    local vars = tonumber(snip.captures[1])
    local nodes = {}
    for j = 1, vars do
        table.insert(nodes, t(" \\dd "))
        table.insert(nodes, r(j, "var" .. tostring(j), i(1)))
    end
    return sn(nil, nodes)
end

return {
    s({ trig = "!ARTICLE" },
        fmta([[
            \documentclass{article}

            \title{<>}
            \author{<>}
            \date{\today}

            \begin{document}

            \tableofcontents
            \maketitle

            \subsection{<>}
            <>

            \end{document}
            ]],
            { i(1), i(2), i(3), i(4) }
        )
    ),

    s(
        { trig = "(%d)int", name = "multi integrals", dscr = "please work", regTrig = true, hidden = false },
        fmt([[
    <> <> <> <>
    ]], { c(1, { fmta([[
    \<><>nt_{<>}
    ]], { c(1, { t(""), t("o") }),
                f(function(_, parent, snip)
                    inum = tonumber(parent.parent.captures[1]) -- this guy's lineage looking like a research lab's
                    res = string.rep("i", inum)
                    return res
                end), i(2), }), d(nil, int1), }),
                i(2), d(3, int2), i(0), },
            { delimiters = "<>" }),
        { condition = math, show_condition = math }),
}
