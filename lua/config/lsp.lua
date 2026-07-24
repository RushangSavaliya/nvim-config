vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },

	filetypes = { "lua" },

	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".git",
	},

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				checkThirdParty = false,
			},

			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, {
				autotrigger = true,
			})
		end
	end,
})
