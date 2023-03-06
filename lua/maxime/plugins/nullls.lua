local M = {
    'jose-elias-alvarez/null-ls.nvim'
}

function M.config()
    require("null-ls").setup({
        sources = {
            -- require("null-ls").builtins.formatting.autopep8,
            require("null-ls").builtins.formatting.prettierd,
            -- require("null-ls").builtins.formatting.black,
            require("null-ls").builtins.formatting.ruff,
            require("null-ls").builtins.formatting.yamlfmt,
            -- require("typescript.extensions.null-ls.code-actions"),
            --         require("null-ls").builtins.diagnostics.eslint,
            --         require("null-ls").builtins.completion.spell,
            --         require("null-ls").builtins.completion.luasnip,
        },
    })
end

return M
