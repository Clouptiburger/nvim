local M = {
    'navarasu/onedark.nvim',
    enabled = true,
    priority = 1000,
}

function M.config()
    require("onedark").setup({
        style = "deep",
        code_style = {
            comments = 'none',
            keywords = 'none',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },
    })
end

return M
