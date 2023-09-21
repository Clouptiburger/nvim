local M = {
    enabled = true,
    'navarasu/onedark.nvim',
    priority = 1000,
}

function M.config()
    require("onedark").setup({
        style = "darker",
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
