local M = {
    'VonHeikemen/lsp-zero.nvim',
    -- event = "BufReadPre",

    enabled = false,
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },

        -- Other lsp stuff
        { "simrat39/rust-tools.nvim" },
    }
}

function M.config()
    -- require("mason").setup()
    -- require("mason-lspconfig").setup()
    local lsp = require('lsp-zero')
    lsp.preset({
        float_border = 'rounded',
        call_servers = 'local',
        configure_diagnostics = false,
        setup_servers_on_start = true,
        set_lsp_keymaps = false,
    })
    -- lsp.nvim_lua_ls()



    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader><C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
        -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", bufopts)
        vim.keymap.set("n", "<leader>co", ":Lspsaga outgoing_calls<CR>", bufopts)
        vim.keymap.set("n", "<leader>ci", ":Lspsaga incoming_calls<CR>", bufopts)
        vim.keymap.set("n", "<leader>gr", ":Lspsaga lsp_finder<CR>", bufopts)
        vim.keymap.set("n", "gr", ":Lspsaga lsp_finder<CR>", bufopts)
        -- nvim
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, bufopts)
        -- jetbrains
        vim.keymap.set("n", "<M-C-L>", vim.lsp.buf.format, bufopts)
        -- vscode
        vim.keymap.set("n", "<S-M-F>", vim.lsp.buf.format, bufopts)
        vim.keymap.set("n", "<leader>cj", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>ck", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
    end

    lsp.on_attach(on_attach)

    -- lsp.set_preferences({
    --     suggest_lsp_servers = false,
    --     sign_icons = {
    --         error = 'E',
    --         warn = 'W',
    --         hint = 'H',
    --         info = 'I'
    --     }
    -- })


    vim.diagnostic.config({
        virtual_text = true
    })
    lsp.configure("marksman", {
        cmd = { vim.fn.stdpath('data') .. "\\mason\\packages\\marksman\\marksman.exe" }, -- works on windows, lets check linux later
    })
    -- Fit Undefined global 'vim'
    lsp.configure('lua-ls', {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })

    local util = require("lspconfig").util
    local rust_lsp = lsp.build_options('rust_analyzer', {})
    local rt = require("rust-tools")
    rt.setup({
        server = rust_lsp
    })
    lsp.configure('gopls', {
        root_dir = util.root_pattern('go.mod')
    })

    lsp.configure('html', {
    })

    lsp.configure('pyright', {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "off",
                    diagnosticMode = "workspace",
                },
            },
        }
    })

    -- local cmp = require('cmp')
    -- -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
    -- local cmp_mappings = lsp.defaults.cmp_mappings({
    --     ['<C-p>'] = cmp.mapping.select_prev_item(),
    --     ['<C-k>'] = cmp.mapping.select_prev_item(),
    --     ['<C-n>'] = cmp.mapping.select_next_item(),
    --     ['<C-j>'] = cmp.mapping.select_next_item(),
    --     ['<C-i>'] = cmp.mapping.complete(),
    --     ['<C-e>'] = cmp.mapping.abort(),
    --     ['TAB'] = nil,
    --     ['<S-TAB>'] = nil,
    --     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- })

    -- disable completion with tab
    -- this helps with copilot setup
    -- cmp_mappings['<Tab>'] = nil
    -- cmp_mappings['<S-Tab>'] = nil

    -- lsp.setup_nvim_cmp({
    --     -- mapping = cmp_mappings,
    --     sources = {
    --         { name = 'path' },
    --         { name = 'nvim_lsp', keyword_length = 0 },
    --         { name = 'buffer',   keyword_length = 3 },
    --         { name = 'luasnip',  keyword_length = 2 },
    --     }
    -- })
    lsp.setup()

    local cmp = require('cmp')
    cmp.setup()

    -- cmp.setup({
    --     mapping = {
    --         ['<C-p>'] = cmp.mapping.select_prev_item(),
    --         ['<C-k>'] = cmp.mapping.select_prev_item(),
    --         ['<C-n>'] = cmp.mapping.select_next_item(),
    --         ['<C-j>'] = cmp.mapping.select_next_item(),
    --         ['<C-i>'] = cmp.mapping.complete(),
    --         ['<C-e>'] = cmp.mapping.abort(),
    --         ['TAB'] = nil,
    --         ['<S-TAB>'] = nil,
    --         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --     }
    -- })
end

--     lsp.configurt("marksman", {
-- function M.init()
--         cmd = { vim.fn.stdpath('data') .. "\\mason\\packages\\marksman\\marksman.exe" }, -- works on windows, lets check linux later
--     })
--     -- Fit Undefined global 'vim'
--     lsp.configure('sumneko_lua', {
--         settings = {
--             Lua = {
--                 diagnostics = {
--                     globals = { 'vim' }
--                 }
--             }
--         }
--     })
--
--     local rust_lsp = lsp.build_options('rust_analyzer', {})
--     local rt = require("rust-tools")
--     rt.setup({
--         server = rust_lsp
--     })
--     lsp.configure('pyright', {
--         settings = {
--             python = {
--                 analysis = {
--                     typeCheckingMode = "off",
--                 },
--             },
--         }
--     })
--     lsp.setup()
--     print("finished init lsp")
-- end

return M
