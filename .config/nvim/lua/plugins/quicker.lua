return {
	"stevearc/quicker.nvim",
	ft = "qf",
	opts = {},
	keys = {
		{
			"<leader>q",
			function()
				require("quicker").toggle()
			end,
			desc = "Toggle quickfix",
		},
		{
			"<leader>Q",
			function()
				require("quicker").toggle({ loclist = true })
			end,
			desc = "Toggle loclist",
		},
	},
}
