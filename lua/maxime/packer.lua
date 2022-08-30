-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
      'kyazdani42/nvim-tree.lua',
          requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
          tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ellisonleao/gruvbox.nvim" }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'doums/darcula'
    --use 'feline-nvim/feline.nvim'
    -- 	use 'vim-airline/vim-airline'
    -- 	use 'vim-airline/vim-airline-themes'
    use 'KarimElghamry/vim-auto-comment'
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
    --use 'kabouzeid/nvim-lspinstall'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'L3MON4D3/LuaSnip'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
end)
