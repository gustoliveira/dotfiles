local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = { "lua", "vim", "json", "yaml", "javascript", "html", "css", "scss", "tsx", "python", "rust", "go", "bash", "dockerfile", "jsonc", "graphql", "ruby", "yaml" },
	ignore_install = { "javascript" },
	modules = {  },
	sync_install = false,
	auto_install = true,
	indent = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
