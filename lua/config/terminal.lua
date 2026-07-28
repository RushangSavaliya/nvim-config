local M = {}

local terminal_buf = nil
local terminal_win = nil

function M.toggle()
	-- If terminal window is open, hide it
	if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
		vim.api.nvim_win_close(terminal_win, true)
		terminal_win = nil
		return
	end

	-- Reuse existing terminal buffer
	if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
		terminal_buf = vim.api.nvim_create_buf(false, true)
		vim.bo[terminal_buf].buflisted = false
		vim.bo[terminal_buf].bufhidden = "hide"

		vim.cmd("botright split")
		terminal_win = vim.api.nvim_get_current_win()

		vim.api.nvim_win_set_buf(terminal_win, terminal_buf)

		vim.cmd("terminal")
	else
		vim.cmd("botright split")
		terminal_win = vim.api.nvim_get_current_win()

		vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
	end

	-- Terminal height
	vim.api.nvim_win_set_height(terminal_win, 10)

	vim.cmd("startinsert")
end

return M
