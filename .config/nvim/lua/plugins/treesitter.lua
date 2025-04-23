return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = {
			"go",
			"javascript",
			"typescript",
			"python",
			"terraform",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
		},
	},
}
