local lsp = require('lsp-zero')
--require('lspconfig').lua_ls.setup({})
--local lsp = reqire('lsp-zero')

require('lspconfig').intelephense.setup({})


require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {'terraformls', 'jsonnet_ls', 'gopls', 'pylsp'},
	handlers = {
		lsp.default_setup,
	}
})


lsp.setup()

local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
})
