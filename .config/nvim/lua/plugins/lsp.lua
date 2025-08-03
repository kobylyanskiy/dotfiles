return { -- language support
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("*", {})
		vim.lsp.enable({
			"gopls",
			"jdtls",
			"kotlin_language_server",
			"lua_ls",
			"ruff",
			"rust_analyzer",
			"ts_ls",
			"terraformls",
			"bashls",
			"yamlls",
		})
	end,
}
