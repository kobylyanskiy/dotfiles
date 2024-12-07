local lsp = require("lsp-zero")
local km, l, api = vim.keymap.set, vim.lsp, vim.api
lsp.extend_lspconfig()

local lspconfig = require("lspconfig")
-- local cmp = require("cmp")

lspconfig.intelephense.setup({})
lspconfig.terraformls.setup({})
lspconfig.tflint.setup({})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "terraformls", "jsonnet_ls", "gopls", "pylsp" },
	handlers = {
		lsp.default_setup,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		local bufopts = { noremap = true, silent = true, buffer = event.bufnr }
		km("n", "[g", vim.diagnostic.goto_prev, bufopts)
		km("n", "]g", vim.diagnostic.goto_next, bufopts)
		km("n", "<leader>dd", vim.diagnostic.setqflist, bufopts)
		km("n", "<leader>rn", ":IncRename ", bufopts)
		km("n", "gD", l.buf.declaration, bufopts)
		km("n", "gd", l.buf.definition, bufopts)
		km("n", "gi", l.buf.implementation, bufopts)
		km("n", "<leader>D", l.buf.type_definition, bufopts)
		km("n", "gr", l.buf.references, bufopts)
		km({ "n", "v" }, "<leader>ca", l.buf.code_action, bufopts)
		km("n", "L", vim.lsp.buf.hover, bufopts)
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars", "*.lua" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- cmp.setup({
-- 	preselect = "item",
-- 	completion = {
-- 		completeopt = "menu,menuone,noinsert",
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 	}),
-- })

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- lspconfig.gopls.setup({
-- 	capabilities = capabilities,
-- 	settings = {
-- 		gopls = {
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 			staticcheck = true,
-- 			gofumpt = true,
-- 		},
-- 	},
-- }

lsp.setup()
