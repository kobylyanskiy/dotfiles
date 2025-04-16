local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
-- local fb_actions = require "telescope._extensions.file_browser.actions"

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pr", builtin.registers, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep_args<CR>", { noremap = true })

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

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"-uu", -- **This is the setting not being respected**
		},
		file_ignore_patterns = { "node_modules", ".git", ".cache", ".terraform", "venv" },
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
			width = 0.87,
			height = 0.80,
		},
		layout_strategy = "flex",
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		border = true,
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		color_devicons = true,
		mappings = {
			n = {
				['<c-d>'] = require('telescope.actions').delete_buffer
			}, -- n
			i = {
				["<C-h>"] = "which_key",
				['<c-d>'] = require('telescope.actions').delete_buffer
			} -- i
		} -- mappings
	},
	pickers = {
		live_grep = {
			additional_args = function(opts)
				return {}
			end,
		},
		buffers = {
			sort_mru = true,
		},
	},
	fzf = {
		fuzzy = true,             -- false will only do exact matching
		override_generic_sorter = true, -- override the generic sorter
		override_file_sorter = true, -- override the file sorter
		case_mode = "smart_case", -- or "ignore_case" or "respect_case"
	},
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
		["ui-select"] = {
			-- layout_strategy = "flex",
			layout_config = {
				width = 100,
				height = 35,
			},

		}
	},
	-- layout_strategy = "flex",
	-- extensions_list = { "themes", "terms" },
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files()
		end

		-- if vim.fn.argv(0) == "." then
		-- 	require("neotree").open()
		-- end
	end,
})
