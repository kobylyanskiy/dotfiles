return {
	"nvim-neotest/nvim-nio",
	"stevearc/dressing.nvim",
	"OXY2DEV/helpview.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"junegunn/limelight.vim",
	"ray-x/go.nvim",
	"ray-x/guihua.lua", -- recommended if need floating window support
	"ntpeters/vim-better-whitespace",
	"lewis6991/gitsigns.nvim",
	"luukvbaal/statuscol.nvim",
	"github/copilot.vim",
	"nvim-tree/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	"catppuccin/nvim",

	{
		"stevearc/quicker.nvim",
		config = function()
			require("quicker").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- {
	-- 	"folke/noice.nvim",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 	},
	-- },

	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
	},

	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- use("tpope/vim-fugitive")
	-- use({
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- })
	--
	-- use({
	-- 	"A7lavinraj/assistant.nvim",
	-- 	dependencies = { "stevearc/dressing.nvim" }, -- optional but recommended
	-- 	-- keys = {
	-- 	-- 	{ "<leader>a", "<cmd>AssistantToggle<cr>", desc = "Toggle Assistant.nvim window" },
	-- 	-- },
	-- 	-- opts = {},
	-- })
	--
	-- use({
	-- 	"folke/trouble.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- })
	--
	-- use({
	-- 	"folke/which-key.nvim",
	-- 	config = function()
	-- 		vim.o.timeout = true
	-- 		vim.o.timeoutlen = 1000
	-- 		require("which-key").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		})
	-- 	end,
	-- })
	--
	-- use({
	-- 	"folke/zen-mode.nvim",
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- })
	--
	-- use({
	-- 	"ryanmsnyder/toggleterm-manager.nvim",
	-- 	dependencies = {
	-- 		"akinsho/toggleterm.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
	-- 	},
	-- })
	--
	-- use({
	-- 	"mfussenegger/nvim-dap",
	-- 	dependencies = {
	-- 		"rcarriga/nvim-dap-ui",
	-- 		"leoluz/nvim-dap-go",
	-- 		"mfussenegger/nvim-dap-python",
	-- 	},
	-- })
	--
	-- use({
	-- 	"ThePrimeagen/harpoon",
	-- 	branch = "harpoon2",
	-- 	dependencies = { { "nvim-lua/plenary.nvim" } },
	-- })
	--
	-- use({
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	-- 	branch = "main",
	-- 	dependencies = {
	-- 		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	-- 		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	-- 	},
	-- 	opts = {
	-- 		debug = true, -- Enable debugging
	-- 		-- See Configuration section for rest
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- })
}
