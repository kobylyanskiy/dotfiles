-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "neovim/nvim-lspconfig",
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use "lukas-reineke/indent-blankline.nvim"

  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use "ntpeters/vim-better-whitespace"

  use "github/copilot.vim"

  use {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
      requires = {
          { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
          { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      },
      opts = {
          debug = true, -- Enable debugging
          -- See Configuration section for rest
      },
      -- See Commands section for default commands if you want to lazy load on them
  }

  use "lewis6991/gitsigns.nvim"

end)


