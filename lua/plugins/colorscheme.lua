local colorscheme = "gruvbox-material"
-- local colorscheme = "everforest"

return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,

		init = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_foreground = "original"

			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_disable_italic_comment = 1

			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "mix"
			vim.g.gruvbox_material_menu_selection_background = "green"

			vim.g.gruvbox_material_diagnostic_text_highlight = 1
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

			vim.g.gruvbox_material_current_word = "underline"
			vim.g.gruvbox_material_show_eob = 0
			vim.g.gruvbox_material_better_performance = 1
		end,

		config = function()
			if colorscheme == "gruvbox-material" then
				vim.cmd.colorscheme("gruvbox-material")
			end
		end,
	},

	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,

		init = function()
			vim.g.everforest_background = "medium"

			vim.g.everforest_enable_bold = 1
			vim.g.everforest_enable_italic = 0
			vim.g.everforest_disable_italic_comment = 1

			vim.g.everforest_ui_contrast = "high"
			vim.g.everforest_show_eob = 0
			vim.g.everforest_current_word = "underline"
			vim.g.everforest_better_performance = 1
		end,

		config = function()
			if colorscheme == "everforest" then
				vim.cmd.colorscheme("everforest")
			end
		end,
	},
}
