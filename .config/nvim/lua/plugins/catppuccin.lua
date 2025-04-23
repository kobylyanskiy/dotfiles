return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
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
			},
			custom_highlights = function()
				return {
					TelescopeNormal = { bg = "#181825" },
					TelescopeBorder = { bg = "#181825" },
					TelescopePromptPrefix = { bg = "#313244" },
					TelescopePromptNormal = { bg = "#313244" },
					TelescopePromptBorder = { bg = "#313244" },
					TelescopePromptTitle = { bg = "#eba0ac", fg = "#181825", bold = true },
					TelescopePromptCounter = { bg = "#313244" },
					TelescopeResultsTitle = { bg = "#181825", fg = "#181825" },
					TelescopePreviewTitle = { bg = "#a6e3a1", fg = "#181825", bold = true },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
