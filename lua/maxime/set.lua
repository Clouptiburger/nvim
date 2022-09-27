vim.cmd "set mouse=a"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.smartindent = true


vim.opt.wrap = false


vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.g.mapleader = " "
-- vim.cmd "set foldmethod=indent"


-- set permanent undo
if vim.fn.has('linux') == 1 then
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
elseif vim.fn.has('win32') == 1 then
    vim.opt.undodir = os.getenv("HOMEPATH") .. "/.vim/undodir"
end

vim.opt.undofile = true
