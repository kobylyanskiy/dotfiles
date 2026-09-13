return { -- language support
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("*", {})
		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					schemaStore = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
					schemas = {
						kubernetes = { "**/kubernetes/**/*.yaml", "**/k8s/**/*.yaml", "*.k8s.yaml", "*.k8s.yml" },
					},
				},
			},
		})
		vim.lsp.enable({
			"gopls",
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
