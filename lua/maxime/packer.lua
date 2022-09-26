--p_implementations This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
     -- NOT USING THIS FOR THE MOMENT
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- use "ThePrimeagen/harpoon"

    -- Colors
    use 'navarasu/onedark.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use { "ellisonleao/gruvbox.nvim" }
    -- use 'tjdevries/colorbuddy.vim'
    -- use 'tjdevries/gruvbuddy.nvim'
    -- use 'folke/tokyonight.nvim'
    -- use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'doums/darcula'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-context'
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
    use 'mg979/vim-visual-multi'
    use 'psliwka/vim-smoothie'
    use "mbbill/undotree"


    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    --use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use { 'saadparwaiz1/cmp_luasnip' }
    --use 'kabouzeid/nvim-lspinstall'
    use 'jose-elias-alvarez/null-ls.nvim'
    use "j-hui/fidget.nvim"
    use "onsails/lspkind.nvim"
    use {
      "prettier/vim-prettier",
      ft = { "html", "javascript", "typescript", "typescriptreact" },
      run = "yarn install",
    }


    use 'L3MON4D3/LuaSnip'
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
    use {
        "AndrewRadev/splitjoin.vim",
        keys = { "gJ", "gS" },
    }

    -- Pretty colors
    use "norcalli/nvim-colorizer.lua"
    use {
        "norcalli/nvim-terminal.lua",
        config = function()
            require("terminal").setup()
        end,
    }
end)
