return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- Use Neovim's current colorscheme for fzf
			fzf_colors = true,

			-- Floating window
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				backdrop = 60,

				preview = {
					border = "rounded",
					hidden = false,
					vertical = "down:45%",
					horizontal = "right:60%",
					layout = "flex",
				},
			},

			-- File picker
			files = {
				hidden = true,
				follow = false,
				no_ignore = false,
			},

			-- Live grep
			grep = {
				hidden = false,
				follow = false,
				no_ignore = false,
			},
		},
	},
}
