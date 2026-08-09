local M = {}
local last_terminal_buf = nil

function M.toggle()
	-- If the focused window is a terminal, close it.
	local cur_win = vim.api.nvim_get_current_win()
	local cur_buf = vim.api.nvim_win_get_buf(cur_win)

	if vim.bo[cur_buf].buftype == "terminal" then
		last_terminal_buf = cur_buf

		if #vim.api.nvim_list_wins() > 1 then
			vim.api.nvim_win_close(cur_win, false)
		else
			-- Only window: swap in an empty scratch buffer. The terminal job
			-- keeps running hidden and is restored on the next toggle.
			vim.api.nvim_win_set_buf(cur_win, vim.api.nvim_create_buf(false, true))
		end
		return
	end

	-- Otherwise close the first visible terminal window.
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)

		if vim.bo[buf].buftype == "terminal" then
			last_terminal_buf = buf
			vim.api.nvim_win_close(win, false)
			return
		end
	end

	-- Reopen the last closed terminal buffer if it is still alive.
	if last_terminal_buf and vim.api.nvim_buf_is_valid(last_terminal_buf) then
		vim.cmd("botright split")
		vim.api.nvim_win_set_buf(0, last_terminal_buf)
		vim.cmd("startinsert")
		return
	end

	-- Reopen any other hidden terminal buffer.
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" and vim.api.nvim_buf_is_valid(buf) then
			vim.cmd("botright split")
			vim.api.nvim_win_set_buf(0, buf)
			vim.cmd("startinsert")
			return
		end
	end

	-- Create a new terminal.
	vim.cmd("botright split | terminal")
	last_terminal_buf = vim.api.nvim_get_current_buf()
	vim.cmd("startinsert")
end

return M
