require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- manual
		"eslint", -- manual
		"rust_analyzer",
		"vimls",
		"bashls",
		"cssls",
		"css_variables",
		"cssmodules_ls",
		"html",
		"tailwindcss",
		"pyright",
		"stylua",
	},
	automatic_enable = {
		"rust_analyzer",
		"vimls",
		"html",
		"bashls",
		"pyright",
		"cssls",
		"tailwindcss",
		"css_variables",
		"cssmodules_ls",
		"stylua",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettierd",
		"eslint_d",
		"stylua",
	},
	auto_update = true,
	run_on_start = true,
})
