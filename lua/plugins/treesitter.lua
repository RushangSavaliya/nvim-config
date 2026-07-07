return {
	{
		"romus204/tree-sitter-manager.nvim",
		config = function()
			require("tree-sitter-manager").setup({
				auto_install = true,
				noauto_install = { "lua" },
			})
		end,
	},
}
