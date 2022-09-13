-- Basic keymaps
vim.keymap.set('i', '§', '\\')
vim.keymap.set('n', 'ù', '#')

-- hide search highlight by pressing esc
vim.keymap.set('n', '<esc>', '<cmd>:noh<CR>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<leader>--', function() vim.cmd 'set foldmethod=indent' end)

-- Quick fix list short cut
vim.keymap.set('n', "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set('n', "<leader>k", "<cmd>cprev<CR>zz")

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
vim.keymap.set('n', "<leader>ft", require('telescope.builtin').treesitter)
vim.keymap.set('n', '<leader>fB', require('telescope.builtin').builtin)
vim.keymap.set('n', "gr", require('telescope.builtin').lsp_references)
vim.keymap.set('n', "gI", require('telescope.builtin').lsp_implementations)
vim.keymap.set('n', "<space>wd", require('telescope.builtin').lsp_document_symbols)
vim.keymap.set('n', "<space>ww", require('telescope.builtin').lsp_dynamic_workspace_symbols)
-- NvimTree
vim.keymap.set('n', '<leader>E', ":NvimTreeToggle<CR>")

-- Markdown
vim.keymap.set('n', '<leader>md', ":MarkdownPreviewToggle<CR>")


vim.keymap.set('n', "<M-h><M-m>", require("harpoon.mark").add_file)
vim.keymap.set('n', "<M-h><M-l>", require("harpoon.ui").toggle_quick_menu)

for i = 1, 5 do
    vim.keymap.set('n',
        string.format("<space>%s", i),
        function()
            require("harpoon.ui").nav_file(i)
        end
    )
end
