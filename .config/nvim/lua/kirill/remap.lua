vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<cr>")

vim.keymap.set("n", "<leader>e", '<Cmd>Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>rf', ':Neotree reveal<CR>', {})

vim.keymap.set("n", "<leader>t", '<Cmd>ToggleTerm<CR>', { silent = true })
vim.keymap.set("n", "<leader>doc", '<Cmd>GoDoc<CR>', { silent = true })
vim.keymap.set("n", "<leader>z", vim.cmd.ZenMode)

vim.keymap.set("n", "<leader>gs", "<Cmd>Telescope git_status<CR>")
vim.keymap.set("n", "<leader>gb", "<Cmd>GitBlameToggle <CR>")
vim.keymap.set("n", "<leader>v", "<Cmd>vsplit <CR><Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>h", "<Cmd>split <CR>")

vim.keymap.set('n', '<leader>b', function()
	require('telescope.builtin').buffers({
		sort_mru = true,
		ignore_current_buffer = true,
		show_all_buffers = false
	})
end)

-- vim.keymap.set("n", "<leader>rn", ":IncRename ")
-- vim.keymap.set("n", "<leader>rn", function()
--   return ":IncRename " .. vim.fn.expand("<cword>")
-- end, { expr = true })
-- vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")