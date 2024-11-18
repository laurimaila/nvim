local M = {}

local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.setup = function()
  map('n', '<Esc>', '<cmd>nohlsearch<CR>')
  map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

  -- Diagnostics
  map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error message' })
  map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
  map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })

  -- Oil
  map('n', '-', '<CMD>Oil<CR>', { desc = 'Oil: parent directory' })
  map('n', '<leader>o', '<CMD>Oil --float<CR>', { desc = 'Oil: floating parent directory' })

  -- Arrow
  map('n', 'H', function()
    require('arrow.persist').previous()
  end, { desc = 'Arrow: previous' })
  map('n', 'L', function()
    require('arrow.persist').next()
  end, { desc = 'Arrow: next' })

  -- Buffer navigation
  map('n', ']b', ':bnext<CR>', { desc = 'Go to next buffer' })
  map('n', '[b', ':bprevious<CR>', { desc = 'Go to previous buffer' })
  map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

  map('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
  map('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

  map('n', '<C-a>', 'ggVG', { desc = 'Select all' })
  map('n', '<M-a>', '<C-a>', { desc = 'Vim default' })
end

return M
