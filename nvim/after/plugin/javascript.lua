vim.g.javascript_format_on_save = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.js", "*.html", "*.jsx", "*.css", "*.scss" },
	command = "setlocal shiftwidth=2 tabstop=2"
})

