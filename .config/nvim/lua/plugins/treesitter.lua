return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSInstallInfo", "TSUpdate", "TSUpdateSync", "TSModuleInfo" },
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	dependencies = {
		{
			-- Kept ONLY for its textobjects query files (@function.outer, etc).
			-- Its Lua runtime is frozen/broken on Neovim 0.12, so we skip its
			-- plugin/*.vim (whose only job is to call that runtime's init) and
			-- let mini.ai read the queries via the safe vim.treesitter API.
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
			end,
		},
	},
	opts = {
		ensure_installed = {
			"go",
			"javascript",
			"typescript",
			"python",
			"terraform",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
		},

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
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
