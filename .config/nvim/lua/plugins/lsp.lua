return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim", build = ":MasonUpdate" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Optional
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "ray-x/lsp_signature.nvim" },
		{ "jose-elias-alvarez/null-ls.nvim", lazy = true }, -- если вдруг
	},
	config = function()
		local lsp = require("lsp-zero")
		lsp.extend_lspconfig()

		local km, l, api = vim.keymap.set, vim.lsp, vim.api

		require("mason").setup({})
		require("mason-lspconfig").setup({
			-- ensure_installed = { "terraformls", "jsonnet_ls", "gopls", "pylsp" },
			handlers = {
				lsp.default_setup,
			},
		})

		local lspconfig = require("lspconfig")
		lspconfig.intelephense.setup({})
		lspconfig.terraformls.setup({})
		lspconfig.tflint.setup({})

		api.nvim_create_autocmd("LspAttach", {
			group = api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local opts = { noremap = true, silent = true, buffer = event.bufnr }
				km("n", "[g", vim.diagnostic.goto_prev, opts)
				km("n", "]g", vim.diagnostic.goto_next, opts)
				km("n", "<leader>dd", vim.diagnostic.setqflist, opts)
				km("n", "<leader>rn", ":IncRename ", opts)
				km("n", "gD", l.buf.declaration, opts)
				km("n", "gd", l.buf.definition, opts)
				km("n", "gi", l.buf.implementation, opts)
				km("n", "<leader>D", l.buf.type_definition, opts)
				km("n", "gr", l.buf.references, opts)
				km({ "n", "v" }, "<leader>ca", l.buf.code_action, opts)
				km("n", "L", l.buf.hover, opts)
			end,
		})

		api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.tf", "*.tfvars", "*.lua" },
			callback = function()
				vim.lsp.buf.format()
			end,
		})

		lsp.setup()
	end,
}
