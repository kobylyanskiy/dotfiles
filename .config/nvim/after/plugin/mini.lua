require("mini.files").setup({
	options = {
		use_as_default_explorer = true,
	},
	mappings = {
		go_in = "L",
		go_in_plus = "l",
	},
})

vim.keymap.set("n", "-", function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
	MiniFiles.open(path)
	MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })
