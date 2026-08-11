return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>b", group = "Buffer" },
				{ "<leader>c", group = "Code" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>r", group = "Rename" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>w", group = "Window" },
			},
		},
	},
}
