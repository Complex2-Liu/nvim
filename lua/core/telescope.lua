local M = {}

M.keymaps = {
  {"n", "<Leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, }},
  {"n", "<Leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],  { noremap = true, }},
  {"n", "<Leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]],    { noremap = true, }},
  {"n", "<Leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],  { noremap = true, }},
}

M.setup = function()
  require("keymaps").set_keymaps(M.keymaps)
end

return M
