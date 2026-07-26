return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		lazy = false,
		config = function(_, opts)
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
			require("blink.cmp").setup(opts)
		end,
		opts = {
			keymap = { preset = "default" },
			completion = {
				documentation = { auto_show = false },
				ghost_text = { enabled = true },
			},
			signature = { enabled = false },
			sources = {
				default = { "lsp", "path", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
