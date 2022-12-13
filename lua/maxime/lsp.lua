require("mason").setup()
require("mason-lspconfig").setup(
-- { ensure_installed = { "sumneko_lua", "pyright", "marksman", "lemminx", "html", "tsserver", "cssls",
--     "clangd" } }
)
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require 'lspconfig/util'
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
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
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local find_svn_ancestor = function(startpath)
    return util.search_ancestors(startpath, function(path)
        if util.path.is_dir(util.path.join(path, '.svn')) or util.path.is_file(util.path.join(path, '.svn')) then
            return path
        end
    end)
end

local find_any_ancestor = function(startpath, ancestor)
    return util.search_ancestors(startpath, function(path)
        if util.path.is_dir(util.path.join(path, ancestor)) or util.path.is_file(util.path.join(path, ancestor)) then
            return path
        end
    end)
end
-- require("lspconfig")["pylsp"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
--
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

-- DAP for rust
local extension_path = vim.env.HOME .. '\\.vscode\\extensions\\vadimcn.vscode-lldb-1.8.1\\'
local codelldb_path = extension_path .. 'adapter\\codelldb.exe'
local liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
local rt = require("rust-tools")

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup { capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags, }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function()
        require("rust-tools").setup {
            dap = {
                adapter = require('rust-tools.dap').get_codelldb_adapter(
                    codelldb_path, liblldb_path)
            },
            server = {
                capabilities = capabilities,
                on_attach = function(_, bufnr)
                    on_attach(_, bufnr)
                    vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
                flags = lsp_flags,
            }
        }
    end,
    ["sumneko_lua"] = function()
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
    end,
    ["pyright"] = function()
        require 'lspconfig'.pyright.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
            -- cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
            root_dir = function(fname)
                local root_files = {
                    'pyproject.toml',
                    -- 'setup.py',
                    'setup.cfg',
                    'requirements.txt',
                    'Pipfile',
                    'pyrightconfig.json',
                }
                return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or
                    find_svn_ancestor(fname)
                    or util.path.dirname(fname)
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
    end,
    ["eslint"] = function()
        require 'lspconfig'.eslint.setup {}
    end,
    ["marksman"] = function()
        require("lspconfig")["marksman"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
            cmd = { vim.fn.stdpath('data') .. "\\mason\\packages\\marksman\\marksman.exe" }, -- works on windows, lets check linux later
        })
    end,
}
-- require 'lspconfig'.pyright.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- cmd = { "pyright-langserver", "--stdio" },
--     filetypes = { "python" },
--     root_dir = function(fname)
--         local root_files = {
--             'pyproject.toml',
--             -- 'setup.py',
--             'setup.cfg',
--             'requirements.txt',
--             'Pipfile',
--             'pyrightconfig.json',
--         }
--         return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or find_svn_ancestor(fname)
--             or util.path.dirname(fname)
--     end,
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 useLibraryCodeForTypes = false,
--                 typeCheckingMode = "off",
--             },
--         },
--     },
-- }
--
-- -- require 'lspconfig'.powershell_es.setup {
-- --     capabilities = capabilities,
-- --     on_attach = on_attach,
-- --     cmd = { 'pwsh', '-NoLogo', '-NoProfile', '-Command',
-- --         "C:/Users/y4qogd/AppData/Local/nvim-data/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1" },
-- --
-- --     root_dir = function(fname)
-- --         return util.find_git_ancestor(fname) or find_svn_ancestor(fname)
-- --             or util.path.dirname(fname)
-- --     end,
-- -- }
--
-- require 'lspconfig'.eslint.setup {}
--
-- require("lspconfig")["kotlin_language_server"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
-- require("lspconfig")["bashls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
--
-- require("lspconfig")["gopls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
--
-- require("lspconfig")["clangd"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
--
-- require("lspconfig")["cssls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
-- require("lspconfig")["html"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
--
-- -- TYPESCRIPT SETUP
-- -- require("lspconfig")["tsserver"].setup({
-- --     capabilities = capabilities,
-- --     on_attach = on_attach,
-- --     flags = lsp_flags,
-- -- })
-- require("typescript").setup({
--     disable_commands = false, -- prevent the plugin from creating Vim commands
--     debug = false, -- enable debug logging for commands
--     go_to_source_definition = {
--         fallback = true, -- fall back to standard LSP definition on failure
--     },
--     server = { -- pass options to lspconfig's setup method
--         capabilities = capabilities,
--         on_attach = on_attach,
--         flags = lsp_flags,
--     },
-- })
-- require("lspconfig")["lemminx"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
-- })
--
-- require("lspconfig")["marksman"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
--     cmd = { vim.fn.stdpath('data') .. "\\mason\\packages\\marksman\\marksman.exe" }, -- works on windows, lets check linux later
-- })
--
-- require("lspconfig")["rust_analyzer"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--         ["rust-analyzer"] = {},
--     },
-- })
-- require("lspconfig")["sumneko_lua"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = lsp_flags,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = "LuaJIT",
--                 -- Setup your lua path
--             },
--             completion = { callSnippet = "Both" },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim" },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 maxPreload = 2000,
--                 preloadFileSize = 50000,
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = { enable = false },
--         },
--     },
-- })

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
