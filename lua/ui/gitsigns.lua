local M = {}

M.options = {
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "+",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
      show_count = true, -- enable showing count of hunk, e.g. number of deleted lines.
    },
    change = {
      hl = "GitSignsChange",
      text = "~",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
      show_count = true,
    },
    delete = {
      hl = "GitSignsDelete",
      text = "-",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
      show_count = true,
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "-",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
      show_count = true,
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "~",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
      show_count = true,
    },
  },
}

M.setup = function()
  require("gitsigns").setup(M.options)
end

return M
