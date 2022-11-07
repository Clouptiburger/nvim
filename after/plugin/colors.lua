-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 50 }
    end,
})
-- vim.cmd "colorscheme darcula"
require('lualine').setup { options = { theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
},
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        }
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { require 'tabline'.tabline_buffers },
        lualine_x = { require 'tabline'.tabline_tabs },
        lualine_y = {},
        lualine_z = {},
    },
}

require 'tabline'.setup { options = {
    show_filename_only = true,
    modified_italic = false
} }
-- require('colorbuddy').colorscheme('gruvbuddy')
-- vim.cmd "colorscheme tokyonight"
-- vim.cmd "colorscheme darcula"
-- Lua


-- Lua
require('onedark').setup {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = true, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
        Normal = { bg = "#1A0B29" },
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
}
require('onedark').load()

-- CATPPUCCIN
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
--
-- require("catppuccin").setup({
--     transparent_background = true,
--     term_colors = true,
--     compile = {
--         enabled = false,
--         path = vim.fn.stdpath("cache") .. "/catppuccin",
--     },
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     styles = {
--         comments = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         conditionals = {},
--         loops = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     integrations = {
--         cmp = true,
--         markdown = true,
--         neogit = true,
--         notify = true,
--         treesitter = true,
--         treesitter_context = true,
--         telescope = true,
--         which_key = true,
--         -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
--     },
--     color_overrides = {},
--     highlight_overrides = {},
-- })
-- vim.cmd [[colorscheme catppuccin]]




-- vim.o.background = "dark" -- or "light" for light mode
-- require("gruvbox").setup({
--     undercurl = true,
--     underline = true,
--     bold = true,
--     italic = false,
--     strikethrough = true,
--     invert_selection = false,
--     invert_signs = false,
--     invert_tabline = false,
--     invert_intend_guides = false,
--     inverse = true, -- invert background for search, diffs, statuslines and errors
--     contrast = "", -- can be "hard", "soft" or empty string
--     palette_overrides = {},
--     overrides = {
--         Normal = { bg = "#1A0B29" }
--     }
--     ,
--     dim_inactive = false,
--     transparent_mode = true,
-- })
--
-- vim.cmd([[colorscheme gruvbox]])
