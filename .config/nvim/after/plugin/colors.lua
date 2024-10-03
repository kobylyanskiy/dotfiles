require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {  -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false, -- disables setting the background color.
	show_end_of_buffer = false,  -- shows the '~' characters after the end of buffers
	term_colors = false,         -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false,         -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15,       -- percentage of the shade to apply to the inactive window
	},
	no_italic = false,           -- Force no italic
	no_bold = false,             -- Force no bold
	no_underline = false,        -- Force no underline
	styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	default_integrations = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	custom_highlights = function()
		return {
			TelescopeNormal = { bg = "#181825" },
			TelescopeBorder = { bg = "#181825" },

			TelescopePromptPrefix = { bg = "#313244" },
			TelescopePromptNormal = { bg = "#313244" },
			TelescopePromptBorder = { bg = "#313244" },
			TelescopePromptTitle = { bg = "#eba0ac", fg = "#181825", bold = true },
			TelescopePromptCounter = { bg = "#313244", },

			TelescopeResultsTitle = { bg = "#eba0ac", bold = true },

			TelescopePreviewTitle = { bg = "#a6e3a1", fg = "#181825", bold = true },
			TelescopeResultsTitle = { bg = "#181825", fg = "#181825" },
		}
	end,
})
vim.cmd.colorscheme "catppuccin"


-- vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = colors.grey })
-- require("flow").setup_options {}
-- require("flow").setup_options {
--   transparent = true,
--   fluo_color = "pink",
--   mode = "normal",
--   aggressive_spell = false,
-- }
-- vim.cmd.colorscheme "flow"
--
