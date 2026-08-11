return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Oil" },
		opts = {
			default_file_explorer = true,
			columns = { "icon", "size", "mtime" },
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open Parent Directory" },
		},
	},
}
