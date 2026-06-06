-- Defer snippet loading until first insert so LuaSnip isn't pulled in at startup.
vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/snippets" },
		})
	end,
})
