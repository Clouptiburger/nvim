local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.set_preferences({
    set_lsp_keymaps = false,
    configure_diagnostics = false,
})

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    })
})

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader><C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>go", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>gr", ":Lspsaga lsp_finder<CR>", bufopts)
    vim.keymap.set("n", "gr", ":Lspsaga lsp_finder<CR>", bufopts)
    vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, bufopts)
    vim.keymap.set("n", "<M-C-L>", vim.lsp.buf.format, bufopts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
end

lsp.on_attach(on_attach)


lsp.configure("marksman", {
    cmd = { vim.fn.stdpath('data') .. "\\mason\\packages\\marksman\\marksman.exe" }, -- works on windows, lets check linux later
})

lsp.configure("pyright", {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    }
})

local rust_lsp = lsp.build_options('rust_analyzer', {})
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
-- null is still required
require("null-ls").setup({
    sources = {
        -- require("null-ls").builtins.formatting.autopep8,
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.formatting.black,
        require("typescript.extensions.null-ls.code-actions"),
        --         require("null-ls").builtins.diagnostics.eslint,
        --         require("null-ls").builtins.completion.spell,
        --         require("null-ls").builtins.completion.luasnip,
    },
})

lsp.setup()
