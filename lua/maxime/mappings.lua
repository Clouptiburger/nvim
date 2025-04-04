-- expand %% to the current dir
vim.keymap.set("c", "%%", "<C-R>=expand('%:p:h')<CR>")

-- centers the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- hide search highlight by pressing esc
vim.keymap.set("n", "<esc>", "<cmd>:noh<CR>")

-- easy navigation through windows
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- Resize window
vim.keymap.set("n", "<A-left>", "<C-w>5<")
vim.keymap.set("n", "<A-right>", "<C-w>5>")
vim.keymap.set("n", "<A-up>", "<C-w>5+")
vim.keymap.set("n", "<A-down>", "<C-w>5-")

-- Quick fix list short cut
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

-- -- paste without yanking
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "x", '"_x') -- no yank with x

-- Esc Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-s>", "<cmd>:w<cr>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for AZERTY convienient mappings
vim.keymap.set("n", "à", "]", { remap = true })
vim.keymap.set("n", "ç", "[", { remap = true })

-- remap for comments
vim.keymap.set("n", "", "gcc", { remap = true })
vim.keymap.set("v", "", "gc", { remap = true })

-- execute current line
vim.keymap.set({ "n", "v" }, "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set({ "n", "v" }, "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- toggle inlay hints
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle inlay hints" })
