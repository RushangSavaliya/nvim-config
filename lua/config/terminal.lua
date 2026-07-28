local M = {}

function M.toggle()
	-- Find an existing terminal window.
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)

		if vim.bo[buf].buftype == "terminal" then
			vim.api.nvim_win_close(win, false)
			return
		end
	end

	-- Reopen an existing hidden terminal buffer.
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
	vim.cmd("startinsert")
end

return M
