local M = {
    enabled = true,
    'stevearc/conform.nvim',
    opts = {},
}


function M.init()
    local c = require("conform")
    c.setup({
        formatters_by_ft = {
            python = { "black" },
            html = { "prettier" },
            yaml = { "prettier" },
            css = { "prettier" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            lua = { 'stylua' },
            markdown = { "prettier" },
        }
    })

    vim.keymap.set('n', "<leader>fr", function() c.format({ lsp_fallback = true }) end, { desc = '[F]o[n]mat' })
end

return M
