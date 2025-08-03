return {
	"nvim-neotest/nvim-nio",
	"AndrewRadev/sideways.vim",
	"OXY2DEV/helpview.nvim",
	-- "ray-x/go.nvim",
	-- "ray-x/guihua.lua", -- recommended if need floating window support
	"ntpeters/vim-better-whitespace",
	"lewis6991/gitsigns.nvim",
	"luukvbaal/statuscol.nvim",
	"nvim-tree/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	"catppuccin/nvim",
	"numToStr/Comment.nvim",

	{
		"stevearc/quicker.nvim",
		config = function()
			require("quicker").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		-- config = function()
		-- 	require("conform").setup()
		-- end,
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

	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
	},

	{ "echasnovski/mini.nvim", version = "*" },

	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
		keys = {
			{ "<leader>a", "<cmd>AerialToggle<cr>", desc = "Aerial" },
		},
	},
}
