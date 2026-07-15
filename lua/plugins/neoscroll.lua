return {
	"karb94/neoscroll.nvim",
	opts = {
		mappings = {
			"<C-u>",
			"<C-d>",
			"<C-b>",
			"<C-f>",
			"zz",
			"zt",
			"zb",
		},

		hide_cursor = true,
		stop_eof = true,
		respect_scrolloff = true,
		cursor_scrolls_alone = true,

		duration_multiplier = 0.3,
		easing = "quadratic",

		performance_mode = false,
	},
}
