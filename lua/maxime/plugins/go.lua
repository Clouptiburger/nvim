local M = {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
    },
    ft = { "go" },
}

function M.config()
    require("go").setup()
end

return M
