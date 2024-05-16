local M = {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}


function M.config()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    require("oil").setup({
        columns = { "icon" },
        keymaps = {
            ["<C-h>"] = false,
            ["<M-h>"] = "actions.select_split",
        },
        view_options = {
            show_hidden = true,
        },
    })
end

return M
