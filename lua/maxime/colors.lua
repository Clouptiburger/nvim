-- vim.cmd "colorscheme darcula"
require('lualine').setup{options = { theme = 'catppuccin' }}
-- require('colorbuddy').colorscheme('gruvbuddy')
-- vim.cmd "colorscheme tokyonight"
-- vim.cmd "colorscheme darcula" 
-- require('onedark').load()

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]
