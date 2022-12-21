-- vim.cmd "let g:inline_comment_dict = {'//': [\"js\", \"ts\", \"cpp\", \"c\", \"dart\"],\'#\': [\'py\', \'sh\'], \'\"\': [\'vim'], \"--\" : [\'lua\']}"

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        command_palette = {
            { "File",
                { "entire selection", ':call feedkeys("GVgg")' },
                { "save current file", ':w' },
                { "save all files", ':wa' },
                { "quit", ':qa' },
                { "file browser", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
                { "search word", ":lua require('telescope.builtin').live_grep()", 1 },
                { "git files", ":lua require('telescope.builtin').git_files()", 1 },
                { "files", ":lua require('telescope.builtin').find_files()", 1 },
                { "search in files", "function() require('maxime.custom').live_grep_shortcuts({ previewer = false }) end",
                    1 },
            },
            { "Help",
                { "tips", ":help tips" },
                { "cheatsheet", ":help index" },
                { "tutorial", ":help tutor" },
                { "summary", ":help summary" },
                { "quick reference", ":help quickref" },
                { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
            },
            { "Vim",
                { "reload vimrc", ":source $MYVIMRC" },
                { 'check health', ":checkhealth" },
                { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
                { "commands", ":lua require('telescope.builtin').commands()" },
                { "command history", ":lua require('telescope.builtin').command_history()" },
                { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
                { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
                { "vim options", ":lua require('telescope.builtin').vim_options()" },
                { "keymaps", ":lua require('telescope.builtin').keymaps()" },
                { "buffers", ":Telescope buffers" },
                { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
                { "paste mode", ':set paste!' },
                { 'cursor line', ':set cursorline!' },
                { 'cursor column', ':set cursorcolumn!' },
                { "spell checker", ':set spell!' },
                { "relative number", ':set relativenumber!' },
                { "search highlighting (F12)", ':set hlsearch!' },
            }
        },
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- pcall(require('telescope').load_extension, 'fzf')
require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')
require('telescope').load_extension('command_palette')

require("fidget").setup {
    text = {
        spinner = "moon",
    },
    align = {
        bottom = true,
    },
    window = {
        relative = "editor",
    },
}

require('Comment').setup()

-- -- Comment
-- vim.keymap.set('n', '<C-:>', 'gcc', { noremap = false })
-- vim.keymap.set('v', '<C-:>', 'gc', { noremap = false })
-- vim.keymap.set('n', '<C-S-:>', 'gbc', { noremap = false })
-- vim.keymap.set('v', '<C-S-:>', 'gb', { noremap = false })

-- NVIM TREE
-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- -- OR setup with some options
-- require("nvim-tree").setup({
--     sort_by = "case_sensitive",
--     view = {
--         adaptive_size = true,
--         mappings = {
--             list = {
--                 { key = "u", action = "dir_up" },
--             },
--         },
--     },
--     renderer = {
--         group_empty = true,
--     },
--     filters = {
--         dotfiles = true,
--     },
-- })

require('spectre').setup()

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    -- show_current_context_start = true,
}

require("toggleterm").setup {
    open_mapping = [[<C-M-T>]]
}


-- colors
require 'terminal'.setup()
require 'colorizer'.setup(
    { '*'; }
)
