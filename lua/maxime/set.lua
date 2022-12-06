vim.cmd "set mouse=a"
vim.cmd "lan en_US.UTF-8"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false



vim.opt.smartindent = true
vim.opt.smarttab = true


vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.termguicolors = true

vim.opt.scrolloff = 10
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
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

local default_options = {
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true, -- set the title of window to the value of the titlestring
    -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
    updatetime = 100, -- faster completion
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    cursorline = true, -- highlight the current line
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
}
for k, v in pairs(default_options) do
    vim.opt[k] = v
end
