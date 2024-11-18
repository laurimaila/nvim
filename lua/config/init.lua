local M = {}

M.setup = function()
    require('config.opts').setup()
    require('config.lazy').setup()
    require('config.keymaps').setup()
    require('config.autocmds').setup()
end

return M
