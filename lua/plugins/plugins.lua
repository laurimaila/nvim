return {

    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('kanagawa').setup {
                theme = 'dragon',
            }
            vim.cmd.colorscheme 'kanagawa'
        end,
    },
    'tpope/vim-sleuth',
    {
        'mbbill/undotree',
        lazy = true,
        keys = {
            {
                '<leader>u',
                vim.cmd.UndotreeToggle,
                desc = 'Toggle Undotree',
            },
        },
    },
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },
    },
    { 'Bilal2453/luvit-meta' },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        lazy = true,
        event = 'VimEnter',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()
        end,
    },
}
