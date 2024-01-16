vim.g.dart_format_on_save = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	command = "setlocal shiftwidth=2 tabstop=2"
})

