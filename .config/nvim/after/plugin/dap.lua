local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()
require("dap-go").setup()
require("dap-python").setup("python3")

-- dap.adapters.python = {
-- 	type = "executable",
-- 	command = "python",
-- 	args = { "-m", "debugpy.adapter" },
-- }

dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
	},
}

dap.configurations.python = {
	{
		type = 'python',
		request = 'launch',
		name = 'My custom launch configuration',
		program = '${file}',
		python = '/opt/homebrew/bin/python3',
		console = 'externalTerminal',
		justMyCode = false,
		-- args = function()
		-- 	local argument_string = vim.fn.input('Program arguments: ')
		-- 	return vim.fn.split(argument_string, " ", true)
		-- end,
	},
	-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
}

-- dap.adapters.go = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { "/home/alex/.local/share/nvim/dapinstall/go/vscode-go/dist/debugAdapter.js" },
-- }

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", dap.continue, {})