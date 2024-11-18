local M = {}

M.setup = function()
  -- Global options
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.have_nerd_font = true

  -- Regular options
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

  -- Schedule clipboard setting
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)

  -- Autocommands
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
end

return M

