local M = {}

M.options = {
  char = "|", -- specify the character to be used as indent line
  bufname_exclude = { 
    "NvimTree", -- you can see the name of nvim-tree buffer by `:buffers!`
  }, 
}

M.setup = function()
  require("indent_blankline").setup(M.options)
  vim.cmd [[highlight IndentBlanklineChar guifg=#FFBF00]] -- highlight indent character
end

return M
