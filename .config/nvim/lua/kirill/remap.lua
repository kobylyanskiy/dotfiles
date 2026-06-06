vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

-- vim.keymap.set("i", "<Esc>b", "<C-O>b")
-- vim.keymap.set("i", "<Esc>f", "<C-O>w")

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "/Users/kirill/Documents/codeforces/*.py",
	command = "0r /Users/kirill/Documents/codeforces/template.py",
})

vim.keymap.set("n", "ycc", "yygccp", { remap = true })

-- quick fix (C-j/C-k are taken by vim-tmux-navigator, so use bracket pairs)
vim.keymap.set("n", "]q", ":cnext<CR>", { silent = true, desc = "Next quickfix" })
vim.keymap.set("n", "[q", ":cprev<CR>", { silent = true, desc = "Prev quickfix" })

-- yank relative path (moved off <leader>cp so c* is the Claude group)
vim.keymap.set("n", "<leader>yp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Yank relative path" })

-- Highlight trailing whitespace (replaces vim-better-whitespace).
-- Guard to real file windows so it never paints popups/floats (e.g. blink's menu).
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#ff5189" })
vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" }, {
	callback = function()
		if vim.fn.win_gettype() == "" and vim.bo.buftype == "" then
			vim.cmd([[match ExtraWhitespace /\s\+$/]])
		end
	end,
})

-- No gutter (sign/fold/number) symbols in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.signcolumn = "no"
		vim.opt_local.foldcolumn = "0"
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- diable snacks_animate
vim.g.snacks_animate = false

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "jsonnet" },
	callback = function()
		vim.b.autoformat = false
	end,
})
