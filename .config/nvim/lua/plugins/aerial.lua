return {
	"stevearc/aerial.nvim",
	cmd = { "AerialToggle", "AerialOpen", "AerialClose", "AerialNavToggle" },
	config = function()
		require("aerial").setup()
	end,
	keys = {
		{ "<leader>A", "<cmd>AerialToggle<cr>", desc = "Aerial" },
		{ "<leader>an", "<cmd>AerialNavToggle<cr>", desc = "Aerial nav" },
	},
}
