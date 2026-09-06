return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		-- builtin_marks = { "<", ">" },
		builtin_marks = {},
		excluded_buftypes = { "terminal", "nofile" },
		mappings = {
			annotate = "m/",
		},
	},
}
