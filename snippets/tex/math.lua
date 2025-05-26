-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

    -- Equations
    s(
        { trig = "eq", dscr = "Equation block" },
        fmta(
            [[
               \begin{equation*}
                   <>
               \end{equation*}
             ]],
            { i(1) }
        )
    ),

    s({ trig = "ff", dscr = "Fractions" }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),

    -- Symbols
    s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),

    s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),

    s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),
}
