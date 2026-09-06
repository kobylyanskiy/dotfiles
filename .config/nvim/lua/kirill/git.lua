local M = {}

local function run(cmd, cwd)
	local res = vim.system(cmd, { cwd = cwd, text = true }):wait(2000)
	return res.code == 0 and vim.trim(res.stdout or "") or nil
end

--- git@host:org/repo.git | ssh://git@host/org/repo | https://host/org/repo -> https://host/org/repo
--- @return string|nil
function M.repo_url(cwd)
	local url = run({ "git", "remote", "get-url", "origin" }, cwd)
	if not url then
		return nil
	end
	url = url:gsub("%.git$", "")
	local host, path = url:match("^git@([^:]+):(.+)$")
	if not host then
		host, path = url:match("^ssh://[^@]+@([^/]+)/(.+)$")
	end
	if host then
		return ("https://%s/%s"):format(host, path)
	end
	if url:match("^https?://") then
		return (url:gsub("^(https?://)[^@/]*@", "%1"))
	end
	return nil
end

--- @return string|nil
function M.pr_url(cwd, n)
	local base = M.repo_url(cwd)
	if not base then
		return nil
	end
	return base .. (base:match("gitlab") and "/-/merge_requests/" or "/pull/") .. n
end

--- #1234 under the cursor, else the first one on the line.
--- @return string|nil
function M.pr_on_line()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2] + 1
	local first, init = nil, 1
	while true do
		local s, e, n = line:find("#(%d+)", init)
		if not s then
			return first
		end
		if col >= s and col <= e then
			return n
		end
		first = first or n
		init = e + 1
	end
end

--- PR number from the commit that last touched `lnum` of `file`.
--- @return string|nil pr, string|nil summary
function M.pr_for_line(file, lnum)
	local out = run({ "git", "blame", "-L", lnum .. "," .. lnum, "--porcelain", "--", file }, vim.fs.dirname(file))
	if not out then
		return nil, nil
	end
	local summary = out:match("\nsummary ([^\n]*)")
	return summary and summary:match("#(%d+)"), summary
end

local function open(n, cwd)
	local url = M.pr_url(cwd, n)
	if not url then
		return vim.notify("No usable git remote", vim.log.levels.WARN)
	end
	vim.ui.open(url)
end

local function buf_dir()
	local name = vim.api.nvim_buf_get_name(0)
	if name ~= "" and vim.fn.filereadable(name) == 1 then
		return vim.fs.dirname(name)
	end
	return vim.fn.getcwd()
end

-- gx on a #1234 opens the PR; anything else falls through to the builtin.
local builtin_gx = vim.fn.maparg("gx", "n", false, true)
vim.keymap.set("n", "gx", function()
	local n = M.pr_on_line()
	if n then
		return open(n, buf_dir())
	end
	if builtin_gx and builtin_gx.callback then
		return builtin_gx.callback()
	end
	vim.ui.open(vim.fn.expand("<cfile>"))
end, { desc = "Open PR #N / URI under cursor" })

-- Straight from the code line, no blame popup needed.
vim.keymap.set("n", "<leader>hP", function()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" or vim.fn.filereadable(file) ~= 1 then
		return vim.notify("Not a file buffer", vim.log.levels.WARN)
	end
	local n, summary = M.pr_for_line(file, vim.api.nvim_win_get_cursor(0)[1])
	if not n then
		return vim.notify("No PR reference in: " .. (summary or "git blame failed"), vim.log.levels.WARN)
	end
	open(n, vim.fs.dirname(file))
end, { desc = "Open PR that changed this line" })

return M
