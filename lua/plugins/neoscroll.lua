return {
	"karb94/neoscroll.nvim",
	opts = {
		mappings = {},

		hide_cursor = true,
		stop_eof = true,
		respect_scrolloff = true,
		cursor_scrolls_alone = true,

		duration_multiplier = 1.0,
		easing = "quadratic",

		performance_mode = false,
	},
	config = function(_, opts)
		local neoscroll = require("neoscroll")
		neoscroll.setup(opts)

		local function scroll(amount)
			return function()
				neoscroll.scroll(amount, { move_cursor = true, duration = 100 })
			end
		end

		local function center()
			vim.cmd("normal! zz")
		end

		vim.keymap.set("n", "<C-u>", function()
			neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 100 })
			center()
		end, { desc = "Scroll up half page (smooth, centered)" })
		vim.keymap.set("n", "<C-d>", function()
			neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 100 })
			center()
		end, { desc = "Scroll down half page (smooth, centered)" })

		vim.keymap.set({ "v", "x" }, "<C-u>", scroll(-vim.wo.scroll), { desc = "Scroll up half page (smooth)" })
		vim.keymap.set({ "v", "x" }, "<C-d>", scroll(vim.wo.scroll), { desc = "Scroll down half page (smooth)" })
		local function win_height()
			return vim.api.nvim_win_get_height(0)
		end

		vim.keymap.set({ "n", "v", "x" }, "<C-b>", function()
			neoscroll.scroll(-win_height(), { move_cursor = true, duration = 450 })
		end, { desc = "Scroll up full page (smooth)" })
		vim.keymap.set({ "n", "v", "x" }, "<C-f>", function()
			neoscroll.scroll(win_height(), { move_cursor = true, duration = 450 })
		end, { desc = "Scroll down full page (smooth)" })
	end,
}
