-- Basic keymaps
vim.keymap.set('i', '§', '\\')
vim.keymap.set('n', 'ù', '#')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')


-- Quick fix list short cut
vim.keymap.set('n', "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set('n', "<leader>j", "<cmd>cprev<CR>zz")

-- -- greatest remap ever
vim.keymap.set('x', '<leader>p', "\"_dP")
-- -- next greatest remap ever : asbjornHaland
vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

vim.keymap.set('v', "<leader>d", "\"_d")

-- Telescope
-- Using Lua functions
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', "<leader>fg", require('telescope.builtin').live_grep)
vim.keymap.set('n', "<leader>fb", require('telescope.builtin').buffers)
vim.keymap.set('n', "<leader>fo", require('telescope.builtin').oldfiles)
vim.keymap.set('n', "<leader>fh", require('telescope.builtin').help_tags)
vim.keymap.set('n', "<leader>fi", require('maxime.custom').live_grep_shortcuts)
vim.keymap.set('n', "<leader>fk", require('telescope.builtin').keymaps)
vim.keymap.set('n', "<leader>fd", require('telescope.builtin').diagnostics)
vim.keymap.set('n', "<leader>/",
    function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy()) end)
vim.keymap.set('n', "<leader>fe", require('maxime.custom').file_browser)
vim.keymap.set('n', "<leader>wt", require('telescope.builtin').treesitter)
-- NvimTree
vim.keymap.set('n', '<leader>E', ":NvimTreeToggle<CR>")


-- Markdown
vim.keymap.set('n', '<leader>md', ":MarkdownPreviewToggle<CR>")
