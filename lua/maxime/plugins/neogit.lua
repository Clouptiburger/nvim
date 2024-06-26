return {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    lazy = true,
    config = function()
        require("neogit").setup({
            kind = "split",
            signs = {
                -- { CLOSED, OPENED }
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
            integrations = { diffview = true },
        })
    end,
    init = function()
        -- vim.keymap.set("n", "<leader>gg", "<cmd>Neogit kind=floating<cr>", { desc = "Neogit" })
        vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
    end,
}
