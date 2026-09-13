return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.misc").setup_restore_cursor()

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

		local markdown_prefix = function(prefix)
			return function(buf_id)
				if vim.bo[buf_id].filetype ~= "markdown" then
					return nil
				end
				return prefix
			end
		end

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				question = {
					pattern = markdown_prefix("^Q:"),
					group = "",
					extmark_opts = { line_hl_group = "MiniHipatternsFlashcard" },
				},
				answer = {
					pattern = markdown_prefix("^A:"),
					group = "",
					extmark_opts = { line_hl_group = "MiniHipatternsFlashcard" },
				},
			},
		})

		vim.api.nvim_set_hl(0, "MiniHipatternsFlashcard", { bg = "#252530" })
		vim.api.nvim_set_hl(0, "MiniHipatternsTodo", { bg = "#d8647e", fg = "#141415", bold = true })

		vim.keymap.set("n", "-", function()
			local buf_name = vim.api.nvim_buf_get_name(0)
			local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
			MiniFiles.open(path)
			MiniFiles.reveal_cwd()
		end, { desc = "Open Mini Files" })
	end,
}
