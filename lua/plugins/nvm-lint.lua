return {
    'mfussenegger/nvim-lint',
    lazy = true,
    -- event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        { '<leader>bl', function() require('lint').try_lint() end, desc = 'Lint buffer' },
    },
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            markdown = { 'markdownlint-cli2' },
            javascript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescript = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
        }
        -- Can be enabled to lint automatically
        --     local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        --     vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        --         group = lint_augroup,
        --         callback = function()
        --             if vim.opt_local.modifiable:get() then lint.try_lint() end
        --         end,
        --     })
    end,
}
