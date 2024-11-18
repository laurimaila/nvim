return {
  lazy = false,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  'stevearc/oil.nvim',
  config = true,
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
    keymaps = {
      ['<C-s>'] = false,
      ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
    },
  },
  keys = {
    { 'n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' } },
  },
}
