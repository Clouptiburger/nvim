return { {
    'simrat39/symbols-outline.nvim',
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
},
-- other plugin doing the same thing but currently less good
    {
        enabled = false,
        "stevearc/aerial.nvim",
        config = true,
    } }
