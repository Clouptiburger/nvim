local M = {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                { buffer = bufnr, desc = 'Preview git hunk' })

            -- don't override the built-in and fugitive keymaps
            local gs = package.loaded.gitsigns
            vim.keymap.set({ 'n', 'v' }, ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
            vim.keymap.set({ 'n', 'v' }, '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
        end,
    },
}

-- function M.init()
--     require("gitsigns").setup({
--         signs = {
--             add = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
--             change = {
--                 hl = "GitSignsChange",
--                 text = "▍",
--                 numhl = "GitSignsChangeNr",
--                 linehl = "GitSignsChangeLn",
--             },
--             delete = {
--                 hl = "GitSignsDelete",
--                 text = "▸",
--                 numhl = "GitSignsDeleteNr",
--                 linehl = "GitSignsDeleteLn",
--             },
--             topdelete = {
--                 hl = "GitSignsDelete",
--                 text = "▾",
--                 numhl = "GitSignsDeleteNr",
--                 linehl = "GitSignsDeleteLn",
--             },
--             changedelete = {
--                 hl = "GitSignsChange",
--                 text = "▍",
--                 numhl = "GitSignsChangeNr",
--                 linehl = "GitSignsChangeLn",
--             },
--             untracked = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
--         },
--         on_attach = function(bufnr)
--             local gs = package.loaded.gitsigns
--
--             local function map(mode, l, r, opts)
--                 opts = opts or {}
--                 if type(opts) == "string" then
--                     opts = { desc = opts }
--                 end
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, l, r, opts)
--             end
--
--             -- Navigation
--             map("n", "]h", function()
--                 if vim.wo.diff then
--                     return "]h"
--                 end
--                 vim.schedule(function()
--                     gs.next_hunk()
--                 end)
--                 return "<Ignore>"
--             end, { expr = true, desc = "Next Hunk" })
--
--             map("n", "[h", function()
--                 if vim.wo.diff then
--                     return "[h"
--                 end
--                 vim.schedule(function()
--                     gs.prev_hunk()
--                 end)
--                 return "<Ignore>"
--             end, { expr = true, desc = "Prev Hunk" })
--
--             -- Actions
--             map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
--             map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
--             map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
--             map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
--             map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
--             map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
--             map("n", "<leader>ghb", function()
--                 gs.blame_line({ full = true })
--             end, "Blame Line")
--             map("n", "<leader>ghd", gs.diffthis, "Diff This")
--             map("n", "<leader>ghD", function()
--                 gs.diffthis("~")
--             end, "Diff This ~")
--
--             -- Text object
--             map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
--         end,
--     })
-- end
--
return M
