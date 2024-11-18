local M = {}

M.setup = function()
    -- Global options
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '
    vim.g.have_nerd_font = true

    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.mouse = 'a'
    vim.opt.showmode = false
    vim.opt.breakindent = true
    vim.opt.undofile = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.signcolumn = 'yes'
    vim.opt.updatetime = 250
    vim.opt.timeoutlen = 300
    vim.opt.splitright = true
    vim.opt.splitbelow = true
    vim.opt.list = true
    vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
    vim.opt.inccommand = 'split'
    vim.opt.cursorline = true
    vim.opt.scrolloff = 10

    -- Line wrapping
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
    vim.opt.breakindent = true

    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- Schedule clipboard setting
    vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
end

return M
