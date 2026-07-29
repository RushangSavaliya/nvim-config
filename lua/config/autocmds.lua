local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text briefly
autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Restore cursor position when reopening a file
autocmd("BufReadPost", {
	group = augroup("restore_cursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Trim trailing whitespace on save
autocmd("BufWritePre", {
	group = augroup("trim_trailing_whitespace", { clear = true }),
	callback = function()
		local view = vim.fn.winsaveview()
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.fn.winrestview(view)
	end,
})

-- Auto-resize splits when the terminal window is resized
autocmd("VimResized", {
	group = augroup("auto_resize_splits", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- LSP keymaps, set only in buffers with an attached client
autocmd("LspAttach", {
	group = augroup("lsp_attach_keymaps", { clear = true }),
	callback = function(event)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
		map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
		map("n", "gr", vim.lsp.buf.references, "Goto References")
		map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("n", "<leader>D", vim.diagnostic.open_float, "Line Diagnostics")
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, "Previous Diagnostic")
		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, "Next Diagnostic")
	end,
})
