local M = {}

local theme_file = vim.fn.stdpath("state") .. "/colorscheme.txt"
local default_theme = "github_light"

function M.save(name)
  if not name or name == "" then
    return
  end

  pcall(vim.fn.writefile, { name }, theme_file)
end

function M.load()
  local ok, content = pcall(vim.fn.readfile, theme_file)
  local theme = (ok and content and content[1] ~= "") and content[1] or default_theme

  pcall(vim.cmd, "colorscheme " .. theme)
end

return M
