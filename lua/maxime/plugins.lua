return {
    "nvim-lua/plenary.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/which-key.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    "sindrets/diffview.nvim",
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        config = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                -- show_current_context = true,
                -- show_current_context_start = truecolor
            }
        end,
    },
    {
        "SmiteshP/nvim-navic",
        enabled = false,
        config = function()
            vim.g.navic_silence = true
            require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup({
                plugins = {
                    gitsigns = true,
                },
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
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
        end
    },
    {
        'glepnir/lspsaga.nvim',
        event = 'BufRead',
        config = function()
            require('lspsaga').setup({
                ui = {
                    code_action = "",
                }
            })
        end,
        dependencies = { {
            'kyazdani42/nvim-web-devicons'
        } }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("todo-comments").setup({
            })
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
        config = function()
            require("trouble").setup({
                auto_open = false,
                use_diagnostic_signs = true, -- en
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require('lsp_signature').setup()
        end
    },
    {
        "stevearc/aerial.nvim",
        keys = { { "<leader>cs", "<cmd>AerialToggle!<cr>", desc = "Symbols Outline" } },
        config = true,
    },

    {
        "danymat/neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment Doc",
            },
        },
        opts = { snippet_engine = "luasnip" },
    },
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>cr",
                function()
                    require("refactoring").select_refactor()
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
            },
        },
        opts = {},
    }
}
