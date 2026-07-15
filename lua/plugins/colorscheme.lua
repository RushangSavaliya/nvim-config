return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- active theme
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			integrations = {
				treesitter = true,
				cmp = true,
				gitsigns = true,
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true, -- installed, switch to it anytime with :colorscheme gruvbox
		opts = {
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true,
			contrast = "hard",
			dim_inactive = false,
			transparent_mode = false,
		},
	},
}
