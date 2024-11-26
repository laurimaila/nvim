local M = {}

local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

M.setup = function()
    map('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
    map('n', '<leader>q', ':q<CR>', { desc = 'Exit' })
    map('n', '<leader>q!', ':q!<CR>', { desc = 'Force exit' })

    map('n', '<C-a>', 'ggVG', { desc = 'Select all' })
    map('n', '<M-a>', '<C-a>', { desc = 'Vim default' })
    map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })
    map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

    -- Diagnostics
    map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error message' })
    map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
    map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
    map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })

    -- Substitute
    map('n', 's', require('substitute').operator, { noremap = true, desc = 'Substitute' })
    map('n', 'ss', require('substitute').line, { noremap = true, desc = 'Substitute line' })
    map('n', 'S', require('substitute').eol, { noremap = true, desc = 'Substitute eol' })
    map('x', 's', require('substitute').visual, { noremap = true, desc = 'Substitute visual' })

    -- Oil
    map('n', '-', '<CMD>Oil<CR>', { desc = 'Oil: parent directory' })

    -- Arrow
    map('n', 'H', function() require('arrow.persist').previous() end, { desc = 'Arrow: previous' })
    map('n', 'L', function() require('arrow.persist').next() end, { desc = 'Arrow: next' })

    -- Buffers
    map('n', ']b', ':bnext<CR>', { desc = 'Go to next buffer' })
    map('n', '[b', ':bprevious<CR>', { desc = 'Go to previous buffer' })
    map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })
end

return M
