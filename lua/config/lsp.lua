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

-- jdtls (Java) is configured here rather than in lsp/jdtls.lua so it wins the
-- merge with nvim-jdtls' own runtime config (which provides init_options).
local jdtls_workspace = vim.fn.stdpath("cache") .. "/jdtls/workspace"
vim.fn.mkdir(jdtls_workspace, "p")

local jdtls_cmd = { "jdtls", "-data", jdtls_workspace, "--jvm-arg=-Xmx4G" }

-- Keep eclipse.jdt.ls from dropping .project/.classpath files into projects
table.insert(jdtls_cmd, "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false")

-- Lombok support via the jar shipped with the mason jdtls package
local lombok_jar = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
if vim.fn.filereadable(lombok_jar) == 1 then
	table.insert(jdtls_cmd, "--jvm-arg=-javaagent:" .. lombok_jar)
end

vim.lsp.config("jdtls", {
	cmd = jdtls_cmd,
	settings = {
		java = {
			format = {
				enabled = true,
				settings = {
					url = "file://" .. vim.fn.stdpath("config") .. "/java/eclipse-java-8tab.xml",
					profile = "Java8Tabs",
				},
			},
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
