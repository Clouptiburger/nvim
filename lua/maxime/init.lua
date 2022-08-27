require("maxime.packer")
require("maxime.keymap")
require("maxime.colors")
require("maxime.lsp")
--require("maxime.lsp")
vim.cmd "set mouse=a"
vim.cmd "set rnu"

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank { higroup = "IncSearch", timeout = 50 }
	end,
})
