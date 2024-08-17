require("trouble").setup {
	position = "right",
	auto_open = false,
	auto_close = true,
	auto_preview = true,
	auto_fold = true,
	signs = {
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠"
	},
	use_lsp_diagnostic_signs = true
}

vim.keymap.set("n", "<leader>xx", '<Cmd>Trouble diagnostics toggle<CR>', {silent = true})
