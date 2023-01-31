local M = {
    'VonHeikemen/lsp-zero.nvim',
    -- event = "BufReadPre",
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
    lsp.preset("recommended")
    lsp.nvim_workspace()
    lsp.set_preferences({
        set_lsp_keymaps = false,
        configure_diagnostics = false,
    })

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


    -- local navic = require("nvim-navic")
    local on_attach = function(_, bufnr)
        -- navic.attach(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Enable completion triggered by <c-x><c-o>
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<leader><C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", bufopts)
        vim.keymap.set("n", "<leader>gr", ":Lspsaga lsp_finder<CR>", bufopts)
        vim.keymap.set("n", "gr", ":Lspsaga lsp_finder<CR>", bufopts)
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, bufopts)
        vim.keymap.set("n", "<M-C-L>", vim.lsp.buf.format, bufopts)
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
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
        virtual_text = true,
    })
    lsp.configure("marksman", {
        cmd = { vim.fn.stdpath('data') .. "\\mason\\packages\\marksman\\marksman.exe" }, -- works on windows, lets check linux later
    })
    -- Fit Undefined global 'vim'
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
    lsp.setup()
end

-- function M.init()
--     lsp.configurt("marksman", {
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
