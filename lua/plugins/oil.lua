return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = true,
    opts = {
        default_file_explorer = true,
        columns = {
            'icon',
            'permissions',
        },
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _) return name == '..' or name == '.git' end,
        },
        keymaps = {
            ['<C-s>'] = false,
            ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open in a vertical split' },
        },
    },
}
