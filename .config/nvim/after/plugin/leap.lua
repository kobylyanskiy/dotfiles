require('leap').create_default_mappings()

local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#303030',
}

vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
vim.api.nvim_set_hl(0, 'LeapMatch', {
	-- For light themes, set to 'black' or similar.
	fg = 'white',
	bold = true,
	nocombine = true,
})
vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'black', bg = 'white' })
vim.api.nvim_set_hl(0, 'LeapLabel', { fg = colors.black, bg = colors.red })
