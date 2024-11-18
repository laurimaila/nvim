return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  extensions = { 'oil' },
  config = function()
    local arrow_status = function()
      return require('arrow.statusline').text_for_statusline_with_icons()
    end
    require('lualine').setup {
      tabline = {
        lualine_a = { arrow_status },
        lualine_b = { 'buffers' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' },
      },
    }
  end,
}
