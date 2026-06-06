return {
	"folke/sidekick.nvim",
	opts = {
		nes = { enabled = false }, -- Next Edit Suggestions need the Copilot LSP; off for now
		cli = {
			win = {
				layout = "right", -- open Claude in a right-side split
				split = { width = 0.4 }, -- 40% of the editor width
				-- Window keymaps use sidekick's defaults: in terminal mode <c-q>
				-- enters normal mode (to scroll), then <c-q>/`q` hides it.
			},
			mux = {
				backend = "tmux",
				enabled = true, -- persist CLI sessions in tmux across nvim restarts
			},
			prompts = {
				refactor = "Refactor {this} for maintainability",
			},
		},
	},
	-- "c = Claude" keymaps
	keys = {
		{
			"<leader>cc",
			function()
				require("sidekick.cli").toggle({ name = "claude", focus = true })
			end,
			mode = { "n", "v" },
			desc = "Claude: toggle",
		},
		{
			"<leader>cp",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "v" },
			desc = "Claude: pick a prompt",
		},
		{
			"<leader>cs",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "n", "v" },
			desc = "Claude: send selection / code block",
		},
		{
			"<leader>cf",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Claude: send file",
		},
		{
			"<leader>cd",
			function()
				require("sidekick.cli").send({ msg = "{diagnostics}" })
			end,
			desc = "Claude: send diagnostics",
		},
	},
}
