local M = {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = { { "nvim-telescope/telescope-file-browser.nvim" }, { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" }, -- { "nvim-telescope/telescope-frecency.nvim" },
        -- { "kkharji/sqlite.lua" }, -- used by frecency
        { "nvim-telescope/telescope-live-grep-args.nvim" }, { "nvim-telescope/telescope-dap.nvim" }, {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    } }
}

function M.config()
    -- local trouble = require("trouble.providers.telescope")

    local telescope = require("telescope")
    local borderless = true
    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case"        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },

            live_grep_args = {
                auto_quoting = true,
                mappings = {
                    i = {}
                }

            }
        },
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top"
            },
            sorting_strategy = "ascending",
            mappings = {
                i = {
                    -- ["<c-t>"] = trouble.open_with_trouble,
                    ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                    ["<C-Up>"] = require("telescope.actions").cycle_history_prev
                }
            },
        }
    })

    -- telescope.load_extension("frecency")
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("dap")
    telescope.load_extension("project")
    telescope.load_extension("live_grep_args")
end

function M.init()
    vim.keymap.set("n", "<leader>ff", require('telescope.builtin').fd, {
        desc = "Telescope Find Files"
    })
    vim.keymap.set('n', '<C-P>', require('telescope.builtin').fd, {
        desc = "Telescope Find Files"
    })
    vim.keymap.set('n', "<leader>fg", require('telescope.builtin').live_grep, {
        desc = "Telescope Live Grep"
    })
    vim.keymap.set('n', "<leader>fb", require('telescope.builtin').buffers, {
        desc = "Telescope Find Buffers"
    })
    vim.keymap.set('n', "<leader>fo", require('telescope.builtin').oldfiles, {
        desc = "Telescope Find Old Files"
    })
    vim.keymap.set('n', "<leader>fh", require('telescope.builtin').help_tags, {
        desc = "Telescope Find Help Tags"
    })
    vim.keymap.set('n', "<leader>fk", require('telescope.builtin').keymaps, {
        desc = "Telescope Find Keymaps"
    })
    vim.keymap.set('n', "<leader>fc", require('telescope.builtin').commands, {
        desc = "Telescope Find Commands"
    })
    vim.keymap.set('n', "<leader>fd", require('telescope.builtin').diagnostics, {
        desc = "Telescope Find Diagnostics"
    })
    vim.keymap.set('n', "<leader>f*", require('telescope.builtin').grep_string, {
        desc = "Telescope Grep String"
    })
    vim.keymap.set('n', "<leader>/", function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())
    end, {
        desc = "Telescope Current Buffer Search"
    })
    vim.keymap.set('n', "<leader>ft", require('telescope.builtin').treesitter, {
        desc = "Telescope Treesitter Search"
    })
    vim.keymap.set('n', '<leader>fB', require('telescope.builtin').builtin, {
        desc = "Telescope Builtins"
    })
    vim.keymap.set('n', '<leader><leader>f', require('telescope.builtin').builtin, {
        desc = "Telescope Builtins"
    })
    -- vim.keymap.set('n', '<leader>fc', ":Telescope neoclip<CR>", { desc = "Telescope neoclip (clipboard)" })
    vim.keymap.set('n', "gR", require('telescope.builtin').lsp_references, {
        desc = "Telescope LSP References"
    })
    vim.keymap.set('n', "gI", require('telescope.builtin').lsp_implementations, {
        desc = "Telescope LSP Implementations"
    })

    vim.keymap.set('n', "<leader>ds", require('telescope.builtin').lsp_document_symbols, {
        desc = "Telescope Document Symbols"
    })
    vim.keymap.set('n', "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, {
        desc = "Telescope Workspace Symbols"
    })

    vim.keymap.set('n', "<leader>fsd", require('telescope.builtin').lsp_document_symbols, {
        desc = "Telescope Document Symbols"
    })
    vim.keymap.set('n', "<leader>fsw", require('telescope.builtin').lsp_dynamic_workspace_symbols, {
        desc = "Telescope Workspace Symbols"
    })

    vim.keymap.set('n', "<leader>fi", require('telescope').extensions.live_grep_args.live_grep_args, {
        desc = "Telescope Live Grep"
    })
    vim.keymap.set('n', "<leader>fI", function()
        require('telescope').extensions.live_grep_args.live_grep_args({
            previewer = false
        })
    end, {
        desc = "Telescope Live Grep [NO PREVIEW]"
    })
    vim.keymap.set('n', "<leader>fe", require('maxime.custom').file_browser, {
        desc = "Telescope File Browser"
    })
    vim.keymap.set('n', "<leader>fp", require('telescope').extensions.project.project, {
        desc = "Telescope Projects"
    })
end

return M
