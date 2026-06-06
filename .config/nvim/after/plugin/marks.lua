require("marks").setup({
	-- builtin_marks = { "<", ">" },
	builtin_marks = {},
	excluded_buftypes = { "terminal", "nofile" },
	mappings = {
		annotate = "m/",
	},
})
