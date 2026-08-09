local root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" }
local root_dir = vim.fs.root(0, root_markers)

vim.opt_local.expandtab = false
vim.opt_local.tabstop = 8
vim.opt_local.shiftwidth = 8
vim.opt_local.softtabstop = 0

if not root_dir then
	return
end

vim.lsp.start({
	name = "jdtls",
	cmd = { "jdtls" },
	root_dir = root_dir,
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		java = {
			format = {
				enabled = true,
				settings = {
					url = vim.fn.stdpath("config") .. "/java/eclipse-java-8tab.xml",
					profile = "Java8Tabs",
				},
			},
		},
	},
})
