local M = {
    enabled = true,
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox"
}


function M.config()
    -- setup must be called before loading the colorscheme
    -- Default options:
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = false,
            comments = false,
            operators = false,
            folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "",  -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
            NormalFloat = { bg = nil },
        },
        dim_inactive = false,
        transparent_mode = true,
    })
    -- vim.cmd("colorscheme gruvbox")
    -- vim.api.nvim_set_hl(0, "NormalFloat", { guibg = "", ctermbg = "" })
end

return M