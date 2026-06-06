return {
	"vague-theme/vague.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		-- NOTE: you do not need to call setup if you don't want to.
		require("vague").setup({
			-- Restore the pre-update look after vague started distinguishing
			-- float backgrounds and linking picker groups to Telescope (which
			-- we don't use). Keeps floats (mini.files / snacks) flush on the
			-- editor background like the older version.
			on_highlights = function(hl, c)
				hl.NormalFloat = { fg = c.fg, bg = c.bg }
				hl.FloatBorder = { fg = c.floatBorder, bg = c.bg }
				hl.SnacksPickerBorder = { fg = c.floatBorder }
				hl.SnacksPickerListCursorLine = { fg = c.constant, bg = c.line }
				hl.SnacksPickerMatch = { fg = c.warning }
				hl.PmenuSel = { fg = c.constant, bg = c.line }
			end,
		})
		vim.cmd("colorscheme vague")
	end,
}
