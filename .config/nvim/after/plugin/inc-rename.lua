-- Setup lives in lua/plugins/inc-rename.lua (opts). Just the keymap here.
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
