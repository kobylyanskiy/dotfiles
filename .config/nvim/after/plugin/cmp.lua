local blink = require("blink.cmp")

blink.setup({
	-- highlight = {
	-- 	-- sets the fallback highlight groups to nvim-cmp's highlight groups
	-- 	-- useful for when your theme doesn't support blink.cmp
	-- 	-- will be removed in a future release, assuming themes add support
	-- 	use_nvim_cmp_as_default = true,
	-- },
	-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
	-- adjusts spacing to ensure icons are aligned

	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'normal',
		use_nvim_cmp_as_default = true,
	},
	-- keymap = { preset = 'default' },
	-- keymap = {
	-- 	accept = '<C-y>',
	-- }

	sources = {
		completion = {
			enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
		},
	},

	fuzzy = {
		prebuilt_binaries = {
			force_version = 'v0.7.3',
		}
	},

	-- experimental auto-brackets support
	-- accept = { auto_brackets = { enabled = true } }

	-- experimental signature help support
	-- trigger = { signature_help = { enabled = true } }
})
