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
			"promql",
			"swift",
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
		-- nvim-treesitter master invokes `tree-sitter generate --no-bindings` for grammars
		-- marked requires_generate_from_grammar; that flag is gone in tree-sitter CLI >=0.25.
		-- Point swift at the upstream tag that ships pre-generated sources instead.
		require("nvim-treesitter.parsers").get_parser_configs().swift.install_info = {
			url = "https://github.com/alex-pinkus/tree-sitter-swift",
			revision = "0.7.3-with-generated-files",
			files = { "src/parser.c", "src/scanner.c" },
			requires_generate_from_grammar = false,
		}
		-- That tag is newer than the grammar nvim-treesitter's bundled swift queries were
		-- written against, so they name tokens the parser no longer has and the whole
		-- highlighter aborts. Drop unknown tokens until the query compiles. Registered
		-- before setup() so it runs ahead of nvim-treesitter's own FileType handler.
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "swift",
			once = true,
			callback = function()
				local query = vim.treesitter.query
				local lines = {}
				for _, file in ipairs(query.get_files("swift", "highlights")) do
					vim.list_extend(lines, vim.fn.readfile(file))
				end
				local text = table.concat(lines, "\n")
				local patched = false
				for _ = 1, 32 do
					local ok, err = pcall(query.parse, "swift", text)
					if ok then
						break
					end
					local token = tostring(err):match('Invalid node type "([^"]+)"')
					if not token then
						return
					end
					text = text:gsub('%s*"' .. vim.pesc(token) .. '"', "")
					text = text:gsub("%[%s*%]%s*@[%w%._]+", "")
					patched = true
				end
				if patched then
					query.set("swift", "highlights", text)
				end
			end,
		})

		require("nvim-treesitter.configs").setup(opts)

		-- The first file is already read when lazy loads us on BufReadPost, so it misses
		-- nvim-treesitter's FileType attach and ends up parsed without injections.
		-- Deferred because that buffer has no filetype yet while config runs.
		vim.schedule(function()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= "" then
					vim.treesitter.stop(buf)
					local ok, parser = pcall(vim.treesitter.get_parser, buf)
					if ok and parser then
						parser:destroy()
					end
					pcall(vim.treesitter.start, buf)
				end
			end
		end)
	end,
}
