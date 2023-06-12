return {
    "akinsho/nvim-toggleterm.lua",
    keys = "<C-M-t>",
    config = function()
        require("toggleterm").setup({
            size = 20,
            hide_numbers = true,
            open_mapping = [[<C-M-t>]],
            shade_filetypes = {},
            shade_terminals = false,
            shading_factor = 0.3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            persist_size = true,
            direction = "horizontal",
        })
    end,
}
