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
    -- tabline = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = { require 'tabline'.tabline_tabs },
    --     lualine_x = { require 'tabline'.tabline_tabs },
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
}

require 'tabline'.setup { options = {
    show_filename_only = true,
    modified_italic    = false,
    show_tabs_only     = true,
    show_tabs_always   = true,
} }
-- require('colorbuddy').colorscheme('gruvbuddy')
require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})
vim.cmd "colorscheme tokyonight"
-- vim.cmd "colorscheme darcula"
-- Lua


-- Lua
-- require('onedark').setup {
--     -- Main options --
--     style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = true, -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--
--     -- toggle theme style ---
--     toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
--     toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
--
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'none',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
--
--     -- Lualine options --
--     lualine = {
--         transparent = true, -- lualine center bar transparency
--     },
--
--     -- Custom Highlights --
--     colors = {}, -- Override default colors
--     highlights = {
--         Normal = { bg = "#1A0B29" },
--     }, -- Override highlight groups
--
--     -- Plugins Config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true, -- use undercurl instead of underline for diagnostics
--         background = true, -- use background color for virtual text
--     },
-- }
-- require('onedark').load()

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
