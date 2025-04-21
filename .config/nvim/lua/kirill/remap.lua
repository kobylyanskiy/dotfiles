vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

vim.keymap.set("n", "<leader>doc", "<Cmd>GoDoc<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>bl", "<Cmd>GitBlameToggle <CR>")
vim.keymap.set("n", "<leader>v", "<Cmd>vsplit <CR><Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>h", "<Cmd>split <CR>")

vim.keymap.set("n", "<leader>a", ":AerialToggle<CR>")

-- vim.api.nvim_set_keymap("n", "<CR>", "<cmd>FineCmdline<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "/Users/kirill/Documents/codeforces/*.py",
	command = "0r /Users/kirill/Documents/codeforces/template.py",
})
