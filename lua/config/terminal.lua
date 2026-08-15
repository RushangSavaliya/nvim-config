local M = {}

local split_buf = nil
local float_buf = nil
local float_win = nil

local function float_opts()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.6)
	return {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		border = "rounded",
	}
end

local function spawn_shell()
	local buf = vim.api.nvim_create_buf(true, false)
	vim.api.nvim_buf_call(buf, function()
		vim.fn.termopen(vim.o.shell)
		vim.bo.filetype = "terminal"
	end)
	return buf
end

local function is_alive(buf)
	return buf ~= nil
		and vim.api.nvim_buf_is_valid(buf)
		and vim.bo[buf].buftype == "terminal"
		and vim.bo[buf].channel ~= 0
end

local function apply_win_chrome(win)
	vim.api.nvim_win_set_option(win, "number", false)
	vim.api.nvim_win_set_option(win, "relativenumber", false)
	vim.api.nvim_win_set_option(win, "signcolumn", "no")
	vim.api.nvim_win_set_option(win, "list", false)
	vim.api.nvim_win_set_option(win, "spell", false)
end

local function open_in_split(buf)
	vim.cmd("botright split")
	vim.api.nvim_win_set_buf(0, buf)
	apply_win_chrome(0)
	vim.cmd("startinsert")
end

function M.toggle_split()
	local cur_win = vim.api.nvim_get_current_win()
	local cur_buf = vim.api.nvim_win_get_buf(cur_win)

	if vim.bo[cur_buf].buftype == "terminal" then
		split_buf = cur_buf
		if #vim.api.nvim_list_wins() > 1 then
			vim.api.nvim_win_close(cur_win, false)
		else
			vim.api.nvim_win_set_buf(cur_win, vim.api.nvim_create_buf(false, true))
		end
		return
	end

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "terminal" then
			split_buf = buf
			vim.api.nvim_win_close(win, false)
			return
		end
	end

	if is_alive(split_buf) then
		open_in_split(split_buf)
		return
	end

	split_buf = spawn_shell()
	open_in_split(split_buf)
end

function M.toggle_float()
	if float_win and vim.api.nvim_win_is_valid(float_win) then
		float_buf = vim.api.nvim_win_get_buf(float_win)
		vim.api.nvim_win_close(float_win, false)
		return
	end

	if not is_alive(float_buf) then
		float_buf = spawn_shell()
	end

	float_win = vim.api.nvim_open_win(float_buf, true, float_opts())
	apply_win_chrome(float_win)
	vim.cmd("startinsert")
end

function M.close()
	if float_win and vim.api.nvim_win_is_valid(float_win) then
		float_buf = vim.api.nvim_win_get_buf(float_win)
		vim.api.nvim_win_close(float_win, false)
		return
	end

	if #vim.api.nvim_list_wins() > 1 then
		vim.api.nvim_win_close(0, false)
	else
		vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(false, true))
	end
end

return M
