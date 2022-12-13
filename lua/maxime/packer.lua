--p_implementations This file can be loaded by calling `lua require('plugins')` from your init.vimpackerpacker.lua

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Telescope
    -- use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope.nvim' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "LinArcX/telescope-command-palette.nvim" }
    --use "ThePrimeagen/harpoon"

    -- Colors
    -- use 'navarasu/onedark.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use { "ellisonleao/gruvbox.nvim" }
    -- use 'tjdevries/colorbuddy.vim'
    -- use 'tjdevries/gruvbuddy.nvim'
    use 'folke/tokyonight.nvim'
    -- use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'doums/darcula'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    -- use "nvim-treesitter/playground"
    -- use {
    --     "danymat/neogen",
    --     config = function()
    --         require('neogen').setup {}
    --     end,
    --     requires = "nvim-treesitter/nvim-treesitter",
    --     -- Uncomment next line if you want to follow only stable versions
    --     -- tag = "*"
    -- }
    use "nvim-treesitter/nvim-treesitter-textobjects"


    --use 'feline-nvim/feline.nvim'
    -- 	use 'vim-airline/vim-airline'
    -- 	use 'vim-airline/vim-airline-themes'


    -- Other tools
    use {
        'numToStr/Comment.nvim'
        -- config = function()
        --     require('Comment').setup()
        -- end
    }
    use "windwp/nvim-ts-autotag"
    use "lukas-reineke/indent-blankline.nvim"
    -- use 'mg979/vim-visual-multi'
    -- use 'psliwka/vim-smoothie'

    -- UNDO tree plugins
    use "mbbill/undotree"
    -- use "sjl/gundo.vim"

    use 'windwp/nvim-spectre'
    use "tpope/vim-sleuth"
    -- Packer
    -- use({
    --     "folke/noice.nvim",
    --     event = "VimEnter",
    --     config = function()
    --         require("noice").setup()
    --     end,
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- })
    -- use {
    --     "smjonas/live-command.nvim",
    --     -- live-command supports semantic versioning via tags
    --     -- tag = "1.*",
    --     config = function()
    --         require("live-command").setup {
    --             commands = {
    --                 Norm = { cmd = "norm" },
    --             },
    --         }
    --     end,
    -- }

    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            -- you'll need at least one of these
            { 'nvim-telescope/telescope.nvim' },
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    }
    -- LSP
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },
    --
    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },
    --
    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     }
    -- }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use { 'saadparwaiz1/cmp_luasnip' }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'simrat39/rust-tools.nvim'


    --use 'hrsh7th/cmp-cmdline'
    --use 'kabouzeid/nvim-lspinstall'
    use 'jose-elias-alvarez/null-ls.nvim'
    use "j-hui/fidget.nvim"
    -- use "onsails/lspkind.nvim"
    use {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup()
        end
    }
    -- use 'folke/lsp-colors.nvim'
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require('lsp_signature').setup()
        end
    }
    use "jose-elias-alvarez/typescript.nvim"
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                code_action_icon = "",
                symbol_in_winbar = {
                    in_custom = true
                }
            })
        end,
    })

    use {
        "folke/lsp-trouble.nvim",
        cmd = "Trouble",
        config = function()
            -- Can use P to toggle auto movement
            require("trouble").setup {
                auto_preview = false,
                auto_fold = true,
            }
        end,
    }
    -- seems nice but heavy
    -- use({
    --     "glepnir/lspsaga.nvim",
    --     branch = "main",
    --     config = function()
    --         local saga = require("lspsaga")
    --
    --         saga.init_lsp_saga({
    --             -- your configuration
    --         })
    --     end,
    -- })
    -- use {
    --     "prettier/vim-prettier",
    --     ft = { "html", "javascript", "typescript", "typescriptreact" },
    --     run = "yarn install",
    -- }


    --     use {
    --         "windwp/nvim-autopairs",
    --         config = function() require("nvim-autopairs").setup {} end
    --     }
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'mfussenegger/nvim-dap-python'
    use 'leoluz/nvim-dap-go'

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use "tpope/vim-surround"
    use "tpope/vim-repeat"

    -- Pretty colors
    use "norcalli/nvim-colorizer.lua"
    use {
        "norcalli/nvim-terminal.lua",
        config = function()
            require("terminal").setup()
        end,
    }
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }



    -- GIT:
    -- use "TimUntersberger/neogit"
    use "tpope/vim-fugitive"
    -- use "tpope/vim-rhubarb"
    -- -- Github integration
    -- if vim.fn.executable "gh" == 1 then
    --     use "pwntester/octo.nvim"
    -- end
    -- use "ruifm/gitlinker.nvim"

    -- Sweet message committer
    -- use "rhysd/committia.vim"
    use "sindrets/diffview.nvim"

    -- -- Floating windows are awesome :)
    -- use {
    --     "rhysd/git-messenger.vim",
    --     keys = "<Plug>(git-messenger)",
    -- }

    -- Async signs!
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- -- Git worktree utility
    -- use {
    --     "ThePrimeagen/git-worktree.nvim",
    --     config = function()
    --         require("git-worktree").setup {}
    --     end,
    -- }

    use { 'kdheepak/tabline.nvim', requires = { 'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons' } }
    -- better joins
    -- use({
    --     'Wansmer/treesj',
    --     requires = {
    --         'nvim-treesitter',
    --     },
    --     config = function()
    --         require('treesj').setup({ use_default_keymaps = false,
    --         })
    --     end,
    -- })
    -- useless stuff
    -- use "ThePrimeagen/vim-be-good"
end)
