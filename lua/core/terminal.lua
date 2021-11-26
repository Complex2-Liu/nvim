local M = {}

M.options = {
  size = 12,
  -- Setting the key to toggle a terminal immediately, works on both normal and insert mode
  -- If prefix the mapping with a number, e.g. "2<C-t>", that particular terminal (the second one) will be opened.
  open_mapping = [[<C-t>]],

  hide_numbers = true, -- hide the number column
  shade_terminals = false, -- disable shading terminal filetypes to be darker than other window

  -- open a terminal with the key defined in `open_mapping` above in horizontal direction
  -- other options are "vertical", "float" and "tag"
  direction = "horizontal",
}

M.setup = function()
  require("toggleterm").setup(M.options)
end

return M
