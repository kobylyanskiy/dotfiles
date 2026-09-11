local vault_path = vim.fs.normalize("~/documents/projects/notes")
local vault = vim.uv.fs_realpath(vault_path) or vault_path

local function extract_note()
	local region = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })
	local default = vim.trim(table.concat(region, " ")):gsub("^%s*[-*+]%s+", ""):gsub("%s+", " ")
	vim.api.nvim_feedkeys(vim.keycode("<esc>"), "nx", false)
	local title = vim.trim(vim.fn.input({ prompt = "Title: ", default = default }))
	if title == "" then
		return vim.notify("extract aborted", vim.log.levels.WARN)
	end
	require("obsidian.actions").extract_note(title)
end

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,
		workspaces = {
			{ name = "notes", path = vault },
		},
		notes_subdir = "01 - Unsorted",
		new_notes_location = "notes_subdir",
		note_id_func = function(title)
			if title == nil or title == "" then
				return tostring(os.date("%Y-%m-%d %H%M"))
			end
			return (title:gsub("[/\\:%*%?\"<>|#%^%[%]]", ""):gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1"))
		end,
		templates = { folder = "templates" },
		daily_notes = {
			folder = "02 - Daily",
			date_format = "%Y-%m-%d",
			workdays_only = false,
			template = "daily note.md",
			default_tags = {},
		},
		picker = { name = "snacks.picker" },
		completion = { min_chars = 2 },
		footer = { enabled = false },
		ui = { enable = false },
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		local exempt = { "02 - Daily/", "templates/", "03 - Archives/" }

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*.md",
			group = vim.api.nvim_create_augroup("obsidian-orphans", { clear = true }),
			callback = function(args)
				local path = vim.fs.normalize(vim.fn.fnamemodify(args.file, ":p"))
				if not vim.startswith(path, vault .. "/") then
					return
				end
				local rel = path:sub(#vault + 2)
				for _, dir in ipairs(exempt) do
					if vim.startswith(rel, dir) then
						return
					end
				end

				local stem = vim.fn.fnamemodify(path, ":t:r")
				vim.system({
					"rg",
					"--files-with-matches",
					"--fixed-strings",
					"--glob",
					"!" .. vim.fn.fnamemodify(path, ":t"),
					"[[" .. stem,
					vault,
				}, { text = true }, function(res)
					if vim.trim(res.stdout or "") ~= "" then
						return
					end
					vim.schedule(function()
						vim.notify(
							("%s has no backlinks — link it from a hub or today's note"):format(stem),
							vim.log.levels.WARN,
							{ title = "orphan note" }
						)
					end)
				end)
			end,
		})
	end,
	keys = {
		{ "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Open note" },
		{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "New note" },
		{ "<leader>oN", "<cmd>Obsidian new_from_template<cr>", desc = "New from template" },
		{ "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search vault" },
		{ "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Tags" },
		{ "<leader>oj", "<cmd>Obsidian today<cr>", desc = "Today" },
		{ "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday" },
		{ "<leader>oJ", "<cmd>Obsidian dailies<cr>", desc = "Dailies" },
		{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
		{ "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Links in note" },
		{ "<leader>oc", "<cmd>Obsidian toc<cr>", desc = "Table of contents" },
		{ "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Rename note" },
		{ "<leader>op", "<cmd>Obsidian paste_img<cr>", desc = "Paste image" },
		{ "<leader>ox", "<cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle checkbox" },
		{ "<leader>oO", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian app" },
		{ "<leader>ow", "<cmd>Obsidian workspace<cr>", desc = "Switch workspace" },
		{ "<leader>ol", "<cmd>Obsidian link<cr>", desc = "Link selection", mode = "v" },
		{ "<leader>oL", "<cmd>Obsidian link_new<cr>", desc = "Link to new note", mode = "v" },
		{ "<leader>oe", extract_note, desc = "Extract to note", mode = "v" },
	},
}
