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

-- quick fix
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- sideways
vim.keymap.set("n", "<C-h>", ":SidewaysLeft<CR>")
vim.keymap.set("n", "<C-l>", ":SidewaysRight<CR>")

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
