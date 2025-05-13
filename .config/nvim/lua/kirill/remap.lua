vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "/Users/kirill/Documents/codeforces/*.py",
	command = "0r /Users/kirill/Documents/codeforces/template.py",
})

vim.keymap.set("n", "ycc", "yygccp", { remap = true })

-- quick fix
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- sideways
vim.keymap.set("n", "<C-h>", ":SidewaysLeft<CR>")
vim.keymap.set("n", "<C-l>", ":SidewaysRight<CR>")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- local argc = vim.fn.argc()
		local argv = vim.fn.argv()
		if #argv == 0 then
			-- No file passed to nvim: open Telescope
			vim.cmd("silent! lua require('telescope.builtin').oldfiles()")
		elseif #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
			-- Opened with `nvim .` or a directory
			vim.cmd("cd " .. argv[1]) -- Change working directory
			vim.cmd("silent! lua require('telescope.builtin').oldfiles()")
		end
		-- If file/dir passed, do nothing (nvim handles it)
	end,
})
