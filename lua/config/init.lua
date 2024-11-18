local M = {}

M.setup = function()
    require('config.opts').setup()
    require('config.keymaps').setup()
end

return M
