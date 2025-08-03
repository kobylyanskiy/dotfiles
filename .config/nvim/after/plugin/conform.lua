require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		rust = { "rustfmt", lsp_format = "fallback" },
		bash = { "shfmt", "shellcheck" },
		zsh = { "shfmt", "shellcheck" },
		sh = { "shfmt", "shellcheck" },
		terraform = { "terraform_fmt" },
		yaml = { "yamlfmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
