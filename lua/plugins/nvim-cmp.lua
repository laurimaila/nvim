return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    lazy = true,
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then return end
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                {
                    'rafamadriz/friendly-snippets',
                    config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
                },
            },
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },

            mapping = cmp.mapping.preset.insert({
                ['<C-y>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),

                ['<C-j>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<C-k>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                -- <M-l> will move you to the right of each of the expansion locations.
                -- <M-h> is similar, except moving you backwards.
                ['<M-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
                end, { 'i', 's' }),
                ['<M-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
                end, { 'i', 's' }),
            }),
            sources = {
                {
                    name = 'lazydev',
                    -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                    group_index = 0,
                },
                { name = 'nvim_lsp', keyword_length = 1 },
                { name = 'buffer', keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'path' },
            },
        })
    end,
}
