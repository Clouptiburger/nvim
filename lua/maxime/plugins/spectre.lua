return {
    "windwp/nvim-spectre",
    cmd = "Spectre",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require('spectre').setup()
    end,
    init = function()
        vim.keymap.set("n", "<leader>S", require("spectre").open, { desc = "Spectre Search and Replace" })
    end,
}
