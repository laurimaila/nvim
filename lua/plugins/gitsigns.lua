return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    lazy = true,
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require 'gitsigns'

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigate to next/previous change
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal { ']c', bang = true }
                else
                    gitsigns.nav_hunk 'next'
                end
            end, { desc = 'Jump to next git change' })

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal { '[c', bang = true }
                else
                    gitsigns.nav_hunk 'prev'
                end
            end, { desc = 'Jump to previous git change' })

            -- Actions
            -- visual mode
            map(
                'v',
                '<leader>gs',
                function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
                { desc = 'Git stage hunk' }
            )
            map(
                'v',
                '<leader>gr',
                function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
                { desc = 'Git reset hunk' }
            )
            -- normal mode
            map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git stage hunk' })
            map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git reset hunk' })
            map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Git stage buffer' })
            map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Git undo stage hunk' })
            map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Git reset buffer' })
            map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git preview hunk' })
            map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git blame line' })
            map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git diff against index' })
            map('n', '<leader>gD', function() gitsigns.diffthis '@' end, { desc = 'Git diff against last commit' })
            -- Toggles
            map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame line' })
            map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = 'Toggle git show deleted' })
        end,
    },
}
