require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		rust = { "rustfmt", lsp_format = "fallback" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
		sh = { "shfmt" },
		terraform = { "terraform_fmt" },
		yaml = { "yamlfmt" },
	},
	formatters = {
		yamlfmt = {
			prepend_args = { "-formatter", "retain_line_breaks_single=true" },
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
