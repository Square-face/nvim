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
    s({ trig = "env", snippetType = "autosnippet" },
        fmta([[
              \begin{<>}
                  <>
              \end{<>}
            ]],
            { i(1), i(2), rep(1) }
        )
    ),

    -- sections
    s({ trig = "seq", snippetType = "autosnippet" },
        fmta([[
              \section{<>}
              <>
            ]],
            { i(1), i(2) }
        )
    ),

    s({ trig = "sseq", snippetType = "autosnippet" },
        fmta([[
              \subsection{<>}
              <>
            ]],
            { i(1), i(2) }
        )
    ),

    s({ trig = "ssseq", snippetType = "autosnippet" },
        fmta([[
              \subsubsection{<>}
              <>
            ]],
            { i(1), i(2) }
        )
    ),
}
