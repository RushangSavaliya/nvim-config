local function has_config(ctx, names)
	return vim.fs.find(names, { path = ctx.dirname, upward = true })[1] ~= nil
end

local function has_ruff_config(ctx)
	if vim.fs.find({ "ruff.toml", ".ruff.toml" }, { path = ctx.dirname, upward = true })[1] then
		return true
	end
	local pyproject = vim.fs.find("pyproject.toml", { path = ctx.dirname, upward = true })[1]
	if pyproject then
		for _, line in ipairs(vim.fn.readfile(pyproject)) do
			if line:match("^%[tool%.ruff") then
				return true
			end
		end
	end
	return false
end

local prettier_configs = {
	".prettierrc",
	".prettierrc.json",
	".prettierrc.yml",
	".prettierrc.yaml",
	".prettierrc.json5",
	".prettierrc.js",
	".prettierrc.cjs",
	".prettierrc.mjs",
	".prettierrc.ts",
	".prettierrc.cts",
	".prettierrc.mts",
	".prettierrc.toml",
	"prettier.config.js",
	"prettier.config.cjs",
	"prettier.config.mjs",
	"prettier.config.ts",
	"prettier.config.cts",
	"prettier.config.mts",
	".editorconfig",
}

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
				-- 8-width tabs unless the project defines its own style
				stylua = {
					append_args = function(_, ctx)
						if not has_config(ctx, { ".stylua.toml", "stylua.toml" }) then
							return { "--indent-type", "Tabs", "--indent-width", "8" }
						end
					end,
				},
				prettier = {
					append_args = function(_, ctx)
						if not has_config(ctx, prettier_configs) then
							return { "--use-tabs", "--tab-width", "8" }
						end
					end,
				},
				ruff_format = {
					append_args = function(_, ctx)
						if not has_ruff_config(ctx) then
							return { "--indent-style", "tab", "--indent-width", "8" }
						end
					end,
				},
			},

			formatters_by_ft = {
				lua = { "stylua" },
				luau = { "stylua" },
				python = { "ruff_format" },
				json = { "prettier" },
				jsonc = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
				sh = { "shfmt" },
				bash = { "shfmt" },
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
