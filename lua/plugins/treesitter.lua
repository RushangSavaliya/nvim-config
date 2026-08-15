return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local nvim_treesitter = require("nvim-treesitter")

			nvim_treesitter.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local ensure_installed = {
				-- Bundled with nvim, but listed for clarity
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				-- Installed
				"bash",
				"cpp",
				"css",
				"desktop",
				"gitignore",
				"html",
				"hyprlang",
				"ini",
				"javascript",
				"java",
				"json",
				"kdl",
				"luau",
				"mermaid",
				"meson",
				"php",
				"php_only",
				"python",
				"toml",
				"yaml",
				"zsh",
				"typescript",
				"tsx",
				"scss",
				"phpdoc",
				"luadoc",
			}

			-- No-op if already installed; bootstraps missing parsers on fresh setups
			nvim_treesitter.install(ensure_installed):wait(300000)

			-- Enable treesitter highlighting (regex highlighting stays as fallback)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
