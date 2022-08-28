-- Telescope
-- Using Lua functions
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', "<leader>fg", require('telescope.builtin').live_grep)
vim.keymap.set('n', "<leader>fb", require('telescope.builtin').buffers)
vim.keymap.set('n', "<leader>fo", require('telescope.builtin').oldfiles)
vim.keymap.set('n', "<leader>fh", require('telescope.builtin').help_tags)
vim.keymap.set('n', "<leader>fi", require('maxime.custom').live_grep_shortcuts)
vim.keymap.set('n', "<leader>fk", require('telescope.builtin').keymaps)
