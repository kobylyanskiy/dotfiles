return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSInstallInfo", "TSUpdate", "TSUpdateSync", "TSModuleInfo" },
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	-- nvim-treesitter master registers its predicates/directives with `all = false`
	-- (one node per capture). Neovim 0.12 dropped that compat path and always hands
	-- handlers a node list, so every custom predicate blows up mid-parse -- which
	-- kills the highlighter for that buffer. Re-wrap registration to feed them a node.
	init = function()
		local query = vim.treesitter.query
		local function compat(register)
			return function(name, handler, opts)
				if type(opts) == "table" and opts.all == false then
					opts = vim.tbl_extend("force", opts, { all = true })
					local legacy = handler
					handler = function(match, ...)
						local nodes = {}
						for id, captured in pairs(match) do
							nodes[id] = type(captured) == "table" and captured[#captured] or captured
						end
						return legacy(nodes, ...)
					end
				end
				return register(name, handler, opts)
			end
		end
		query.add_predicate = compat(query.add_predicate)
		query.add_directive = compat(query.add_directive)
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
