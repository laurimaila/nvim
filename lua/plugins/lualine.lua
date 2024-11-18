return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    extensions = { 'oil' },
    config = function()
        local arrow_status = function() return require('arrow.statusline').text_for_statusline_with_icons() end
        require('lualine').setup {
            sections = {
                lualine_x = { arrow_status, 'encoding', 'filetype' },
            },
            extensions = { 'oil' },
        }
    end,
}
