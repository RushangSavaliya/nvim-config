return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				["clang-format"] = {
					args = {
						"-assume-filename",
						"$FILENAME",
						"-style=file:" .. vim.fn.stdpath("config") .. "/.clang-format",
					},
				},
			},

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
				php = { "php-cs-fixer" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},

		config = function(_, opts)
			require("conform").setup(opts)

			-- Trim trailing whitespace on save, registered after conform's own
			-- BufWritePre handler so it always runs on the formatted result.
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("trim_trailing_whitespace", { clear = true }),
				callback = function()
					local view = vim.fn.winsaveview()
					vim.cmd([[keeppatterns %s/\s\+$//e]])
					vim.fn.winrestview(view)
				end,
			})
		end,
	},
}
