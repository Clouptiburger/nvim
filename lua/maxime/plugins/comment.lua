local M = {
    "numToStr/Comment.nvim",
    enabled = false,
    keys = { "gc", "gcc", "gbc" },
}

function M.config()
    require("Comment").setup()
end

return M
