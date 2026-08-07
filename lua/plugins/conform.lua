return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				luau = { "stylua" },
				python = { "ruff_format" },
				json = { "jq" },
				jsonc = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				java = { "clang_format_java" },
				php = { "php-cs-fixer" },
			},

			formatters = {
				clang_format_java = {
					inherit = "clang-format",
					append_args = {
						"--style={BasedOnStyle: LLVM, IndentWidth: 8, TabWidth: 8, UseTab: Always}",
					},
				},
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
