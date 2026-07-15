return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		----------------------------------------------------------------
		-- Highlights the current syntax chunk (function, if, loop, etc.)
		----------------------------------------------------------------
		chunk = {
			enable = true,
			use_treesitter = true,
			delay = 0,
			duration = 0,

			-- Default is false. When true, draw a straight vertical line
			-- instead of the ╭── and ╰── connectors.
			-- straight = false,

			-- Default chunk characters.
			-- chars = {
			--     horizontal_line = "─",
			--     vertical_line = "│",
			--     left_top = "╭",
			--     left_bottom = "╰",
			--     right_arrow = ">",
			-- },

			-- Text object for operating on a chunk.
			-- Example: "ic" -> vic, dic, yic...
			-- textobject = "",

			-- Disable chunk rendering for huge files.
			-- max_file_size = 1024 * 1024,

			-- Highlight broken chunks differently.
			error_sign = true,
		},

		----------------------------------------------------------------
		-- Indentation guides
		----------------------------------------------------------------
		indent = {
			enable = true,
		},

		----------------------------------------------------------------
		-- Highlight line numbers of the current chunk
		----------------------------------------------------------------
		line_num = {
			enable = true,
		},

		----------------------------------------------------------------
		-- Show whitespace characters
		----------------------------------------------------------------
		blank = {
			enable = true,
		},
	},
}
