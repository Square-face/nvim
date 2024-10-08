local plug = { 'nvimdev/dashboard-nvim' }
plug.event = 'VimEnter'

plug.opts = function()
    local header = {
        '             ...                                                      ',
        '       .:-#+ *@%#+-                                                   ',
        '    ..:--=*#%@@@@@@-                                                  ',
        '            .-*@@@@@                                                  ',
        '               -@@@@.                                                 ',
        '                %@@@                                                  ',
        '                *@@#                                                  ',
        '                +@@-                                                  ',
        '                +@#                                                   ',
        '                %@+                                                   ',
        '               *@@#                                                   ',
        '              -@@@@=                                                  ',
        '              %@@@@@*.                                                ',
        '             :@@@@@@@@+:                                              ',
        '             +@@@@@@@@@@#=.                                           ',
        '             #@@@@@@@@@@@%#+=:.                                       ',
        '             *@@@@@@%*###*#####*+==---::..                            ',
        '             :@@@@@@#:.-*################**++===--:::.                ',
        '              +@@@@@@@%=::-+*#########################*++=-:.         ',
        '               *@@@@@@@@@%*=::--=+*###############**+===++=-.         ',
        '                =@@@@@@@@@@@@%#*+=-::--==+***+=-:::-==++=:            ',
        '                 .+@@@@@@@@@@@@@@@@@%**++=----+*%@@@%#+-.             ',
        '                   .+%@@@@@@@@@@@@@@@@@@@@@@@@@@%*-.                  ',
        '                      :+%@@@@@@@@@@@@@@@@@@@#+-.                      ',
        '                         -+*%%@@@@%@#%#*+=:.                          ',
        '                             ....: -.                                 ',
        '                                   %=                                 ',
        '                                  .@=                                 ',
        '                                  =@-                                 ',
        '                                  *@:                                 ',
        '                                  *%.                                 ',
        '                                                                      ',
        '                          ==-.                                        ',
        '                          :.                                          ',
        '                                                                      ',
    }

    return {
        theme = 'hyper',
        config = {
            header = header,
            footer = {},
            shortcut = {
                {
                    icon = '󰊳 ',
                    desc = 'Update',
                    action = 'Lazy update',
                    key = 'u'
                },
                {
                    icon = ' ',
                    desc = 'Files',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    icon = ' ',
                    desc = 'Grep',
                    action = 'Telescope live_grep',
                    key = 'r'
                },
            },
        },
    }
end

return plug
