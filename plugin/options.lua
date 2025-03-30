vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_winsize = 30

vim.opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
vim.opt.formatoptions:remove("o")

-- makes the statusline take all splits
vim.opt.laststatus = 3

local default_options = {
    hidden = true,    -- required to keep multiple buffers and open multiple buffers
    hlsearch = true,  -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a",      -- allow the mouse to be used in neovim
    pumheight = 10,   -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,  -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    title = true,     -- set the title of window to the value of the titlestring
    --  titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    cursorline = true, -- highlight the current line
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    undofile = true,  -- Save undo history
    nu = true,
    relativenumber = true,
    errorbells = false,
    smarttab = true,
    wrap = false,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    termguicolors = true,
    scrolloff = 10,
    cmdheight = 1,                 -- Give more space for displaying messages.,
    updatetime = 50,               -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable,     -- delays and poor user experience.,
    timeoutlen = 300,              -- time to wait for a mapped sequence to complete (in milliseconds)
    breakindent = true,            -- Enable break indent
    completeopt = "menuone,noselect", -- Set completeopt to have a better completion experience
}
for k, v in pairs(default_options) do
    vim.opt[k] = v
end

vim.diagnostic.config({
    -- Use the default configuration
    virtual_lines = true

    -- Alternatively, customize specific options
    -- virtual_lines = {
    --  -- Only show virtual line diagnostics for the current cursor line
    --  current_line = true,
    -- },
})
