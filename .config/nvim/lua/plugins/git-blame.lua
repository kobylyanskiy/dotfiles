return {
	"f-person/git-blame.nvim",
	opts = {
		enabled = false,
	},
	keys = {
		{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git blame" },
	},
}
-- vim.keymap.set("n", "<leader>t", "<Cmd>GitBlameToggle<CR>")
