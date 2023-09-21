vim.cmd "set mouse=a"
-- Don't pass messages to |ins-completion-menu|.
-- vim.opt.shortmess:append("c")

vim.cmd("lan en")
vim.cmd("set rnu")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.cmd "set foldmethod=indent"

vim.g.netrw_winsize = 30

-- -- set permanent undo
-- if vim.fn.has('linux') == 1 then
--     vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- elseif vim.fn.has('win32') == 1 then
--     vim.opt.undodir = os.getenv("HOMEPATH") .. "/.vim/undodir"
-- end

local default_options = {
    conceallevel = 0,       -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hidden = true,          -- required to keep multiple buffers and open multiple buffers
    hlsearch = true,        -- highlight all matches on previous search pattern
    ignorecase = true,      -- ignore case in search patterns
    mouse = "a",            -- allow the mouse to be used in neovim
    pumheight = 10,         -- pop up menu height
    showmode = false,       -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,        -- always show tabs
    smartcase = true,       -- smart case
    smartindent = true,     -- make indenting smarter again
    splitbelow = true,      -- force all horizontal splits to go below current window
    splitright = true,      -- force all vertical splits to go to the right of current window
    swapfile = false,       -- creates a swapfile
    title = true,           -- set the title of window to the value of the titlestring
    -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
    writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    cursorline = true,      -- highlight the current line
    signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time
    clipboard = "unnamedplus",
    undofile = true,        -- Save undo history
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
    cmdheight = 1,                   -- Give more space for displaying messages.,
    updatetime = 50,                 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable,     -- delays and poor user experience.,
    timeoutlen = 300,                -- time to wait for a mapped sequence to complete (in milliseconds)
    breakindent = true,              -- Enable break indent
    completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
}
for k, v in pairs(default_options) do
    vim.opt[k] = v
end

-- powershell, currently deactivated as it clashes with the floatting terminal of the go plugin
if true then
    local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
end
