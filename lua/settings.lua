-- traditional vim settings: set options value
local M = {}

M.options = {
  number = true, -- show line number
  relativenumber = true, -- show the line number relative to the line your cursor is on
  scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
  mouse = "a", -- enable mouse support for all mode
  cursorline = true, -- highlight the current line
  termguicolors = true, -- enable gui color (24-bit RGB) in your terminal (some terminal doesn't support this, like macos default terminal)

  -- convert tabs to space
  -- insert 2 spaces for each indentation
  -- one tab occupies 2 spaces
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
}

M.setup = function()
  for k, v in pairs(M.options) do
    vim.opt[k] = v
  end
end

return M
