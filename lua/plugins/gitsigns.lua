return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "]c", gs.next_hunk, "Next Hunk")
				map("n", "[c", gs.prev_hunk, "Prev Hunk")
				map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
				map("n", "<leader>gu", gs.undo_stage_hunk, "Unstage Hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
				map("n", "<leader>gd", gs.diffthis, "Diff This")
			end,
		},
	},
}
