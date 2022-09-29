require("mason").setup()
require("mason-lspconfig").setup()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
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
    vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>fr", vim.lsp.buf.formatting, bufopts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
local util = require 'lspconfig/util'

require 'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(fname)
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'pyrightconfig.json',
        }
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = false,
                typeCheckingMode = "off",
            },
        },
    },
}
-- require("lspconfig")["pyright"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
--     single_file_support = true,
--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "off",
--             },
--         },
--     }
-- })
require("lspconfig")["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
})
require("lspconfig")["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
})
require("lspconfig")["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
})
require("lspconfig")["lemminx"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
})
require("lspconfig")["marksman"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
})
require("lspconfig")["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {},
    },
})
require("lspconfig")["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
            },
            completion = { callSnippet = "Both" },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                maxPreload = 2000,
                preloadFileSize = 50000,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
        },
    },
})

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.autopep8,
        require("null-ls").builtins.formatting.prettierd,
        --         require("null-ls").builtins.diagnostics.eslint,
        --         require("null-ls").builtins.completion.spell,
        --         require("null-ls").builtins.completion.luasnip,
    },
})
