local M = {
    'stevearc/conform.nvim',
    opts = {},
}


function M.init()
    local c = require("conform")
    c.setup({
        formatters_by_ft = {
            python = { "black" },
            html = { "prettierd" },
            typescript = { "prettierd" },
            javascript = { "prettierd" },
            json = { "prettierd" },
        }
    })

    vim.keymap.set('n', "<leader>fr", function() c.format({ lsp_fallback = true }) end, { desc = '[F]o[n]mat' })
end

return M

