vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = true },
	virtual_text = { spacing = 4, source = "if_many" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "⚑",
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"luau_lsp",
	"html",
	"cssls",
	"ts_ls",
	"emmet_language_server",
	"clangd",
	"intelephense",
	"jdtls",
})
