local fd_os_release = assert(io.open("/etc/os-release", "r"))
local s_os_release = fd_os_release:read("*a")
fd_os_release:close()
s_os_release = s_os_release:lower()
local is_nixos = s_os_release:match("nixos")
vim.print(is_nixos)

vim.g.nix = is_nixos == "nixos"

require("core.opts")
require("core.keymaps")
require("core.lazy")
