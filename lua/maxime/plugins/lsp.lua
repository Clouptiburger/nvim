local M = {
    'neovim/nvim-lspconfig',
    -- event = "BufReadPre",

    enabled = true,
    dependencies = {
        -- LSP Support
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { "folke/neodev.nvim",                opts = {} },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
    }
}


function M.config()
    require("neodev").setup({})
    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            -- Create your keybindings here...
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", bufopts)
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
            -- vim.keymap.set("n", "<leader>co", ":Lspsaga outgoing_calls<CR>", bufopts)
            -- vim.keymap.set("n", "<leader>ci", ":Lspsaga incoming_calls<CR>", bufopts)
            vim.keymap.set("n", "<leader>gr", ":Lspsaga lsp_finder<CR>", bufopts)
            vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", bufopts)
            vim.keymap.set("n", "<leader>ci", ":Telescope lsp_incoming_calls<CR>", bufopts)
            vim.keymap.set("n", "<leader>co", ":Telescope lsp_outgoing_calls<CR>", bufopts)
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
    })

    require('mason').setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "jsonls" },
    }

    local lspconfig = require('lspconfig')

    local cmp = require('cmp')
    cmp.setup {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-e>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
        }
    }
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- adds config to servers
    local servers          = {
        pyright = {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            }
        },
    }

    require('mason-lspconfig').setup_handlers({
        function(server_name)
            local config = {}
            if not (servers[server_name] == nil) then
                config = servers[server_name]
            else
                config = {}
            end
            config.capabilities = lsp_capabilities
            lspconfig[server_name].setup(
                config
            )
        end,
    })
end

return M
