local root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" }
local root_dir = vim.fs.root(0, root_markers)

if not root_dir then
	return
end

vim.lsp.start({
	name = "jdtls",
	cmd = { "jdtls" },
	root_dir = root_dir,
	settings = {
		java = {},
	},
})
