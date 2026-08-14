return {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
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
}
