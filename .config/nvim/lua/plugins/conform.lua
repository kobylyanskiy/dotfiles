return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
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
		format_on_save = function(bufnr)
			if vim.b[bufnr].autoformat == false or vim.g.autoformat == false then
				return
			end
			return { timeout_ms = 500 }
		end,
	},
}
