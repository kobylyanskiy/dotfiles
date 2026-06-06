return {
	"OXY2DEV/helpview.nvim",
	"lewis6991/gitsigns.nvim",
	"luukvbaal/statuscol.nvim",
	"nvim-tree/nvim-web-devicons",
	"stevearc/conform.nvim",
	"towolf/vim-helm",

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
		url = "https://codeberg.org/andyg/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		keys = {
			{ "s", "<Plug>(leap)", mode = { "n", "x", "o" }, desc = "Leap" },
			{ "S", "<Plug>(leap-from-window)", desc = "Leap from window" },
		},
		config = function()
			require("leap")
			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.api.nvim_set_hl(0, "LeapMatch", { fg = "black", bg = "white", bold = true, nocombine = true })
			vim.api.nvim_set_hl(0, "LeapLabel", { fg = "#080808", bg = "#ff5189" })
		end,
	},

	{ "echasnovski/mini.nvim", version = "*" },
}
