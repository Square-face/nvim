local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
    s(
        { trig = "!ARTICLE" },
        fmta(
            [[
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
}
