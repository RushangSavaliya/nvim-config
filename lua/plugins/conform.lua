return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				luau = { "stylua" },
				python = { "ruff_format" },
				json = { "jq" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				php = { "php-cs-fixer" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
