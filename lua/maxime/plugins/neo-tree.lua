local M = {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
}

function M.config()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require("neo-tree").setup({
        filesystem = {
            follow_current_file = true,
            hijack_netrw_behavior = "open_current",
        },
    })
    vim.keymap.set("n", "<leader>E", "<cmd>NeoTreeRevealToggle<CR>", { desc = "Open File Tree" })
end

return M
