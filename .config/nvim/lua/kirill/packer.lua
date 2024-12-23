-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("f-person/git-blame.nvim")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"A7lavinraj/assistant.nvim",
		requires = { "stevearc/dressing.nvim" }, -- optional but recommended
		-- keys = {
		-- 	{ "<leader>a", "<cmd>AssistantToggle<cr>", desc = "Toggle Assistant.nvim window" },
		-- },
		-- opts = {},
	})

	use({
		"saghen/blink.cmp",
		tag = "v0.7.3",
		requires = {
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
		},
	})

	use({ "nvim-neotest/nvim-nio" })

	-- use({
	-- 	"ThePrimeagen/harpoon",
	-- 	branch = "harpoon2",
	-- 	requires = { { "nvim-lua/plenary.nvim" } },
	-- })

	use({ "stevearc/dressing.nvim" })
	use({ "OXY2DEV/helpview.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	})

	-- use({
	-- 	"rmagatti/auto-session",
	-- 	-- config = function()
	-- 	-- 	require("auto-session").setup({
	-- 	-- 		auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	-- 	-- 	})
	-- 	-- end,
	-- })

	use({
		"stevearc/quicker.nvim",
		config = function()
			require("quicker").setup()
		end,
	})

	use("luukvbaal/statuscol.nvim")
	use("github/copilot.vim")
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		requires = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		--  config = function()
		-- require("telescope").load_extension("live_grep_args")
		--  end
	})

	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	-- use({
	-- 	"folke/zen-mode.nvim",
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- })

	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- use({
	-- 	"ryanmsnyder/toggleterm-manager.nvim",
	-- 	requires = {
	-- 		"akinsho/toggleterm.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
	-- 	},
	-- })

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	-- Lua
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use({ "junegunn/limelight.vim" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("nvim-tree/nvim-web-devicons")

	use({
		"kristijanhusak/vim-dadbod-ui",
		requires = { "tpope/vim-dadbod" },
	})

	use({
		"ibhagwan/fzf-lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- use {
	--   'VonHeikemen/fine-cmdline.nvim',
	--   requires = {
	--     {'MunifTanjim/nui.nvim'}
	--   }
	-- }

	-- lazy.nvim
	use({
		"folke/noice.nvim",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
		},
	})

	-- use({
	-- 	"folke/trouble.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- })

	use({
		"ggandor/leap.nvim",
		requires = {
			"tpope/vim-repeat",
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

	use("nvim-treesitter/playground")

	use("mbbill/undotree")
	-- use("tpope/vim-fugitive")

	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommended if need floating window support

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			-- { "hrsh7th/nvim-cmp" },
			-- { "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls",
			},
		},
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	use("ntpeters/vim-better-whitespace")

	use("lewis6991/gitsigns.nvim")
end)
