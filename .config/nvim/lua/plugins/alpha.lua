return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[                     _,-}}-._                         ]],
				[[                     /\   }  /\                        ]],
				[[                   _|(O\\_ _/O)                  ___|_ ]],
				[[                  _|/  (__''__)                 |#####|]],
				[[                _|\/    WVVVVW                  |#####|]],
				[[               \ _\     \MMMM/_             .-----.###|]],
				[[             _|\_\     _ '---; \_           |#####|###|]],
				[[        /\   \ _\/      \_   /   \          |#####|###|]],
				[[       / (    _\/     \   \  |'VVV     P    |#####|###|]],
				[[      (  '-,._\_.(      'VVV /      (_/|\_) |#####|###|]],
				[[       \         /   _) /   _)     (_/_ _\_)|#####|###|]],
				[[        '....--''\__vvv)\__vvv)_____|_| |_|_|#####|###|_____]],
			}

			vim.api.nvim_set_hl(0, "godzilla", { fg = "#ff5500", bold = true })
			dashboard.section.header.opts = {
				position = "center",
				hl = "godzilla",
			}

			dashboard.section.buttons.val = {
				dashboard.button("f", "🔍 Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "🕘 Recent files", ":Telescope oldfiles<CR>"),
				dashboard.button("q", "🚪 Quit", ":qa<CR>"),
				dashboard.button("e", "📄 Oil", function()
					require("oil").toggle_float()
				end),
			}

			dashboard.section.footer.opts.hl = "Constant"

			alpha.setup(dashboard.opts)

			-- Detect if opened with a directory and stay in that dir
			if vim.fn.argc() == 1 then
				local arg = vim.fn.argv(0)
				local stat = vim.loop.fs_stat(arg)
				if stat and stat.type == "directory" then
					vim.cmd("cd " .. arg)
					alpha.start()
				end
			end
		end,
	},
}
