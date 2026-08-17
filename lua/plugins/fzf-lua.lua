return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			fzf_colors = true,
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
			files = {
				hidden = true,
				follow = false,
				no_ignore = false,
				previewer = true,
			},
			grep = {
				hidden = true,
				follow = false,
				no_ignore = false,
			},
			keymap = {
				fzf = {
					["ctrl-t"] = "select-all",
					["ctrl-x"] = "jump-accept",
				},
			},
			actions = {
				files = {
					["enter"] = "file_edit",
					["ctrl-q"] = "send_all_to_qf",
				},
				grep = {
					["enter"] = "file_edit",
					["ctrl-q"] = "send_all_to_qf",
				},
			},
		},
	},
}
