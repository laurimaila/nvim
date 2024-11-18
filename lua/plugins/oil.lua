return {
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    'stevearc/oil.nvim',
    config = true,
    opts = {
        default_file_explorer = true,
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
