return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	dependencies = {
		-- Kept ONLY for its textobjects query files (@function.outer, etc).
		-- Its Lua runtime is frozen/broken on Neovim 0.12, so we never call its
		-- setup or keymaps — mini.ai (after/plugin/mini.lua) reads these queries
		-- directly via the safe vim.treesitter API.
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	-- Configuration lives in after/plugin/treesitter.lua (single configs.setup call).
}
