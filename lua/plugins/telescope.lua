return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function() return vim.fn.executable 'make' == 1 end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<ESC>'] = require('telescope.actions').close,
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                        ['<C-d>'] = require('telescope.actions').delete_buffer,
                        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-l>'] = require('telescope.actions').select_horizontal,
                        ['<C-Space>'] = require('telescope.actions').select_tab,
                    },
                },
            },
            -- pickers = {}
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find giles' })
        vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Find select' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find current word' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find live grep' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find resume' })
        vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffers' })

        vim.keymap.set(
            'n',
            '<leader>/',
            function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 20,
                    previewer = false,
                })
            end,
            { desc = 'Fuzzy search current buffer' }
        )

        vim.keymap.set(
            'n',
            '<leader>f/',
            function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end,
            { desc = 'Live grep open files' }
        )

        vim.keymap.set(
            'n',
            '<leader>fn',
            function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,
            { desc = 'Find Neovim files' }
        )
    end,
}
