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
				"lemminx",
				"basedpyright",
				"html-lsp",
				"css-lsp",
				"typescript-language-server",
				"emmet-language-server",
				"clangd",
				"intelephense",
				-- Formatters
				"stylua",
				-- Treesitter CLI (used by nvim-treesitter to build parsers)
				"tree-sitter-cli",
				"ruff",
				"prettier",
				"clang-format",
				"php-cs-fixer",
				"shfmt",
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
