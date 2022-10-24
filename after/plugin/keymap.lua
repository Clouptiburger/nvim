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
vim.keymap.set('n', '<leader>u', ":UndotreeToggle<CR>")
-- Quick fix list short cut
vim.keymap.set('n', "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set('n', "<leader>k", "<cmd>cprev<CR>zz")

-- -- paste without yanking
vim.keymap.set('x', '<leader>p', "\"_dP")
vim.keymap.set('n', 'x', '"_x') -- no yank with x

-- -- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set('x', '<leader>p', "\"+p")
-- vim.keymap.set('n', '<leader>p', "\"+p")
-- vim.keymap.set('v', '<leader>p', "\"+p")

-- vim.keymap.set('x', '<C-S-V>', "\"+p")
-- vim.keymap.set('n', '<C-S-V>', "\"+p")
-- vim.keymap.set('v', '<C-S-V>', "\"+p")

-- vim.keymap.set('x', '<leader>P', "\"+P")
-- vim.keymap.set('n', '<leader>P', "\"+P")
-- vim.keymap.set('v', '<leader>P', "\"+P")

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
vim.keymap.set('n', "<leader>fi", function() require('maxime.custom').live_grep_shortcuts({ previewer = false }) end)
vim.keymap.set('n', "<leader>fk", require('telescope.builtin').keymaps)
vim.keymap.set('n', "<leader>fd", require('telescope.builtin').diagnostics)
vim.keymap.set('n', "<leader>/",
    function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy()) end)
vim.keymap.set('n', "<leader>fe", require('maxime.custom').file_browser)
vim.keymap.set('n', "<leader>ft", require('telescope.builtin').treesitter)
vim.keymap.set('n', '<leader>fB', require('telescope.builtin').builtin)

vim.keymap.set('n', "gr", require('telescope.builtin').lsp_references)
vim.keymap.set('n', "gI", require('telescope.builtin').lsp_implementations)

vim.keymap.set('n', "<leader>wd", require('telescope.builtin').lsp_document_symbols)
vim.keymap.set('n', "<leader>ww", require('telescope.builtin').lsp_dynamic_workspace_symbols)


vim.keymap.set('n', '<leader>ds', ":AerialToggle<CR>")
-- Git
-- vim.keymap.set('n', "<leader>fgs", require('telescope.builtin').git_status)
-- vim.keymap.set('n', "<leader>fgc", require('telescope.builtin').git_commits)

-- NvimTree
vim.keymap.set('n', '<leader>E', ":NvimTreeToggle<CR>")

-- Markdown
vim.keymap.set('n', '<leader>md', ":MarkdownPreviewToggle<CR>")

-- -- harpoon
-- vim.keymap.set('n', "<leader>a", require("harpoon.mark").add_file)
-- vim.keymap.set('n', "<leader>h", require("harpoon.ui").toggle_quick_menu)
--
-- for i = 1, 5 do
--     vim.keymap.set('n',
--         string.format("<leader>%s", i),
--         function()
--             require("harpoon.ui").nav_file(i)
--         end
--     )
-- end

-- Terminal
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>")

-- Resize window
vim.keymap.set('n', '<A-left>', '<C-w>5<')
vim.keymap.set('n', '<A-right>', '<C-w>5>')
vim.keymap.set('n', '<A-up>', '<C-w>5+')
vim.keymap.set('n', '<A-down>', '<C-w>5-')


vim.keymap.set('n', '<C-A-left>', '<C-w><')
vim.keymap.set('n', '<C-A-right>', '<C-w>>')
vim.keymap.set('n', '<C-A-up>', '<C-w>+')
vim.keymap.set('n', '<C-A-down>', '<C-w>-')


-- Search Spectre
vim.keymap.set('n', '<leader>S', require('spectre').open)
vim.keymap.set('n', '<leader>sw', function() require('spectre').open_visual({selected_word=true}) end)
vim.keymap.set('v', '<leader>s', require('spectre').open_visual)
vim.keymap.set('n', '<leader>sf', require('spectre').open_file_search)
