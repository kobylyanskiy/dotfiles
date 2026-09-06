return {
	"OXY2DEV/helpview.nvim",
	"lewis6991/gitsigns.nvim",
	"luukvbaal/statuscol.nvim",
	"nvim-tree/nvim-web-devicons",
	"stevearc/conform.nvim",
	"towolf/vim-helm",
	"monaqa/dial.nvim",

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

	{ "echasnovski/mini.nvim", version = "*" },
}
