local status_ok = pcall(require, "nvim-treesitter")
if not status_ok then
	print("nvim-treesitter not found")
	return
end

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "go", "javascript", "typescript", "python", "terraform", "c", "lua", "vim", "vimdoc", "query" },

	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		additional_vim_regex_highlighting = false,
	},
	-- textobjects (af/if/ac/ic, ...) are handled by mini.ai in after/plugin/mini.lua
})
