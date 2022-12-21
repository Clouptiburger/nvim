local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.preset("recommended")
-- lsp.set_preferences({
--     set_lsp_keymaps = false,
--     configure_diagnostics = false,
-- })

local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})


local on_attach = function(_, bufnr)
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

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
local rust_lsp = lsp.build_options('rust_analyzer', {})
local rt = require("rust-tools")
rt.setup({
    server = rust_lsp
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

-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
