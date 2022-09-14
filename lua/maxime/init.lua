require("maxime.packer")
require('maxime.set')
require("maxime.lsp")
require("maxime.dap")
require('maxime.luasnip')
require("maxime.cmp")
require("maxime.treesitter")
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 50 }
    end,
})
