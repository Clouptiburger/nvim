local wk = require("which-key")

wk.setup({
    show_help = false,
    triggers = "auto",
    plugins = { spelling = true },
    key_labels = { ["<leader>"] = "SPC" },
})
-- expand %% to the current dir
vim.keymap.set('c', '%%', "<C-R>=expand('%:p:h')<CR>")

-- centers the screen
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('i', "<A-j>", "<Esc>:m .+1<CR>==gi")
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('i', "<A-k>", "<Esc>:m .-2<CR>==gi")
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('n', "<A-j>", ":m .+1<CR>==")
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('n', "<A-k>", ":m .-2<CR>==")
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('v', "<A-j>", ":m '>+1<CR>gv-gv")
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('v', "<A-k>", ":m '<-2<CR>gv-gv")

-- hide search highlight by pressing esc
vim.keymap.set('n', '<esc>', '<cmd>:noh<CR>')

-- easy navigation through windows
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

-- Resize window
vim.keymap.set('n', '<A-left>', '<C-w>5<')
vim.keymap.set('n', '<A-right>', '<C-w>5>')
vim.keymap.set('n', '<A-up>', '<C-w>5+')
vim.keymap.set('n', '<A-down>', '<C-w>5-')

vim.keymap.set('n', '<C-A-left>', '<C-w><')
vim.keymap.set('n', '<C-A-right>', '<C-w>>')
vim.keymap.set('n', '<C-A-up>', '<C-w>+')
vim.keymap.set('n', '<C-A-down>', '<C-w>-')

-- Quick fix list short cut
vim.keymap.set('n', "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set('n', "<leader>k", "<cmd>cprev<CR>zz")

-- -- paste without yanking
vim.keymap.set('x', '<leader>p', "\"_dP")
vim.keymap.set('n', 'x', '"_x') -- no yank with x

-- Esc Terminal
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>")
