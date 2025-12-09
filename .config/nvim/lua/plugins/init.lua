return {
	"nvim-neotest/nvim-nio",
	"AndrewRadev/sideways.vim",
	"OXY2DEV/helpview.nvim",
	"ntpeters/vim-better-whitespace",
	"lewis6991/gitsigns.nvim",
	"luukvbaal/statuscol.nvim",
	"nvim-tree/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	"numToStr/Comment.nvim",
	"RRethy/nvim-treesitter-textsubjects",
	"stevearc/conform.nvim",

	{
		"stevearc/quicker.nvim",
		config = function()
			require("quicker").setup()
		end,
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
}
