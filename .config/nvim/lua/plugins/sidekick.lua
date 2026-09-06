return {
	"folke/sidekick.nvim",
	opts = {
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
				create = "split", -- run Claude in a real tmux pane, not an nvim terminal
				split = { vertical = true, size = 0.4 }, -- side-by-side, Claude on the right at 40%
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
