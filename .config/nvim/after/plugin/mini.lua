require("mini.files").setup({
	options = {
		use_as_default_explorer = true,
	},
	mappings = {
		go_in = "L",
		go_in_plus = "l",
	},
})

-- Treesitter textobjects via mini.ai (replaces the frozen nvim-treesitter-textobjects).
-- Uses vim.treesitter queries directly, so it works on Neovim 0.12.
local ai = require("mini.ai")
ai.setup({
	custom_textobjects = {
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
		o = ai.gen_spec.treesitter({
			a = { "@block.outer", "@conditional.outer", "@loop.outer" },
			i = { "@block.inner", "@conditional.inner", "@loop.inner" },
		}),
	},
})

vim.keymap.set("n", "-", function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
	MiniFiles.open(path)
	MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })
