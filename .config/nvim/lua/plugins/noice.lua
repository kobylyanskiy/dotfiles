return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = false,
				inc_rename = true,
				lsp_doc_border = false,
			},
			cmdline = {
				format = {
					search_down = { view = "cmdline" },
					search_up = { view = "cmdline" },
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "DEBUG",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "lsp",
						kind = "progress",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "lsp",
						kind = "progress",
						cond = function(message)
							local client = vim.tbl_get(message.opts, "progress", "client")
							return client == "pylsp"
						end,
					},
					opts = { skip = true },
				},
			},
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 1, 2 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
				-- Optional popupmenu config (currently commented out)
				-- popupmenu = {
				--   relative = "editor",
				--   position = {
				--     row = 8,
				--     col = "50%",
				--   },
				--   size = {
				--     width = 60,
				--     height = 10,
				--   },
				--   border = {
				--     style = "rounded",
				--     padding = { 0, 1 },
				--   },
				--   win_options = {
				--     winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				--   },
				-- },
			},
		})
	end,
}
