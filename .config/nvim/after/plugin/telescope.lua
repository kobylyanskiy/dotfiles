local telescope = require("telescope")
local builtin = require('telescope.builtin')
-- local fb_actions = require "telescope._extensions.file_browser.actions"

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pr', builtin.registers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	":Telescope live_grep_args<CR>",
	{ noremap = true }
)

local focus_preview = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local picker = action_state.get_current_picker(prompt_bufnr)
	local prompt_win = picker.prompt_win
	local previewer = picker.previewer
	local winid = previewer.state.winid
	local bufnr = previewer.state.bufnr
	vim.keymap.set("n", "<Tab>", function()
		vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
	end, { buffer = bufnr })
	vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
	-- api.nvim_set_current_win(winid)
end


require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("file_browser")



telescope.setup({
	defaults = {
		extensions = {
			live_grep_args = {
				mappings = {
					i = {
						["<Tab>"] = focus_preview,
					},
					n = {
						["<Tab>"] = focus_preview,
					},
				},
			},
		},
		layout_strategy = "flex",
	},
})
