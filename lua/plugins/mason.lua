return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			ui = {
				border = "single",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				-- LSP servers
				"lua-language-server",
				"luau-lsp",
				"jdtls",
				"basedpyright",
				"html-lsp",
				"css-lsp",
				"typescript-language-server",
				"clangd",
				"intelephense",
				-- Formatters
				"stylua",
				"ruff",
				"jq",
				"prettier",
				"clang-format",
				"php-cs-fixer",
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
